class BallClock
attr_accessor :queue_tray, :minute_tray, :five_tray, :hour_tray

  def initialize
    #create empty trays
    @queue_tray   = []
    @minute_tray  = []
    @five_tray    = []
    @hour_tray    = []

    #fill up the queue tray with "balls," such that nubmers equal balls
    (1.upto(127)).each do |ball|
      @queue_tray << ball
    end
  end

  #the obvious methods, add_minute being the foundation
  def add_minute
    ball = grab_next_ball
    if @minute_tray < 4
      @minute_tray << ball
    else
      add_five(ball)
      refill_queue_tray(@minute_tray)
      @minute_tray = []
    end
  end

  private

  def add_five(ball)
    if @five_tray < 11
      @five_tray << ball
    else
      add_hour(ball)
      refill_queue_tray(@five_tray)
      @five_tray = []
    end
  end

  def add_hour

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
