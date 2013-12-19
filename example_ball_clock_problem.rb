class BallClock
  attr_accessor :original_tray, :queue_tray, :tray_one, :tray_five, :tray_hour

  def initialize(ball_count)
    raise "ball_count must be equal to or less than 100" if ball_count > 100

    @original_tray = []
    @queue_tray    = []
    @tray_one      = []
    @tray_five     = []
    @tray_hour     = []

    (1.upto(27 + ball_count)).each { |i| @queue_tray << i; @original_tray << i }
  end

  def add_minute
    ball = next_ball
    if @tray_one.size < 4
      @tray_one << ball
    else
      add_five_minute(ball)
      empty_to_queue_tray(@tray_one)
      @tray_one = []
    end
  end

  def add_five_minute(ball)
    if @tray_five.size < 11
      @tray_five << ball
    else
      add_hour(ball)
      empty_to_queue_tray(@tray_five)
      @tray_five = []
    end
  end

  def add_hour(ball)
    @tray_hour << ball
    if @tray_hour.size == 11
      empty_to_queue_tray(@tray_hour)
      @tray_hour = []
    end
  end

  def next_ball
    @queue_tray.shift
  end

  def empty_to_queue_tray(balls)
    balls.reverse.each do |ball|
      @queue_tray.push(ball)
    end
  end

  def time
    min = @tray_one.size + (@tray_five.size * 5)
    "#{@tray_hour.size + 1}:#{min}"
  end

  def debug
    [@total_balls, @queue_tray.size, @tray_one.size, @tray_five.size, @tray_hour.size].join(", ")
  end

  def original_sequence?
    @queue_tray == @original_tray
  end

  def self.run(ball_count, max_minutes=1_000_000)
    limit            = max_minutes
    minutes          = 0
    is_original      = false

    bc = new(ball_count)

    while is_original != true
      if minutes >= limit
        puts "Exceeded #{limit} minutes"
        break
      end

      bc.add_minute
      if bc.original_sequence?
        puts "It took #{(minutes / 60) / 24} hours!"
        break
      end

      minutes += 1
    end
  end
end

BallClock.run(63, 1_000_000)
