require "tempfile"

module NgrokV1
  class Client
    def initialize(options = {})
      raise "Failed to find ngrok v1 binary." unless binary_installed?
      raise "Port number not specified." unless options.key?(:port)
      raise "Protocol not specified." unless options.key?(:protocol)

      @port = options[:port]
      @protocol = options[:protocol]
      @log = nil
      @pid = nil
      @uri = nil
    end

    def start
      return if running?

      @log = Tempfile.new("ngrok-v1")
      @pid = Process.spawn(execution_string)

      at_exit { stop } # Ensure process is killed if Ruby exits.

      @uri = parse_uri!
    end

    def stop
      return unless running?

      Process.kill("KILL", @pid)

      @pid = nil
    end

    def running?
      !@pid.nil?
    end

    def uri
      @uri if running?
    end

    private

    def binary_installed?
      !`ngrok version`.empty?
    rescue Errno::ENOENT
      false
    end

    def execution_string
      s = "exec ngrok"
      s << " -log stdout"
      s << " -proto #{@protocol}" if @protocol
      s << " #{@port}" if @port
      s << " > #{@log.path} 2>&1"
    end

    def parse_uri!(max_seconds = 10)
      max_seconds.times do
        sleep 1
        @log.rewind

        if match_data = @log.read.match(/Tunnel established at (.*)$/)
          return match_data.captures.first
        end
      end

      stop
      raise "Failed to establish tunnel." # Timeout.
    end
  end
end
