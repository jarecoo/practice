class BallClock
attr_accessor :queue_tray, :minute_tray, :five_tray, :hour_tray

  def initialize
    @queue_tray   = []
    @minute_tray  = []
    @five_tray    = []
    @hour_tray    = [1]

    (1.upto(127)).each do |ball|
      @queue_tray << ball
    end
  end

  def time
    "#{@hour_tray.size}:#{@minute_tray.size + (@five_tray.size * 5)}"
  end

  def add_minute
    ball = grab_next_ball
    if @minute_tray.size < 4
      @minute_tray << ball
    else
      add_five(ball)
      refill_queue_tray(@minute_tray)
      @minute_tray = []
    end
  end

  private

  def add_five(ball)
    if @five_tray.size < 11
      @five_tray << ball
    else
      add_hour(ball)
      refill_queue_tray(@five_tray)
      @five_tray = []
    end
  end

  def add_hour(ball)
    if @hour_tray.size < 12
      @hour_tray << ball
    else
      refill_queue_tray(@hour_tray)
      @hour_tray = [1]
    end
  end

  def refill_queue_tray(tray_balls)
    tray_balls.each do |ball|
      @queue_tray.push(ball)
    end
  end

  def grab_next_ball
    @queue_tray.shift
  end

end
