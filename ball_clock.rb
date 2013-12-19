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
      @minute_tray.each do |ball|
        @queue_tray.push(ball)
      end
    end

  end

  private

  def add_five(ball)
    @five_tray << ball
  end

  def add_hour

  end

  def refill_queue_tray

  end

  def grab_next_ball
    @queue_tray.shift
  end

end
