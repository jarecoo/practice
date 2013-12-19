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
    ball = @queue_tray.shift
    @minute_tray << ball
  end

  private #really we want all the work to be done by adding a minute ball

  def add_five

  end

  def add_hour

  end

  def refill_queue_tray

  end

end
