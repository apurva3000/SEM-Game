public class StopWatchTimer {    
    private long startTime = 0;  
    private long stopTime = 0;
    private boolean running = false;
  
    /*
     * Description: start timer
     */    
    public void start() {
        this.startTime = System.currentTimeMillis();
        this.running = true;
    }
  
    /*
     * Description: stop timer
     */     
    public void stop() {
        this.stopTime = System.currentTimeMillis();
        this.running = false;
    }
  
    /*
     * Description: elaspsed time in milliseconds
     */     
    public long getElapsedTime() {
        long elapsed;
        if (running) {
             elapsed = (System.currentTimeMillis() - startTime);
        }
        else {
            elapsed = (stopTime - startTime);
        }
        return elapsed;
    }
      
    /*
     * Description: elaspsed time in seconds
     */    
    public long getElapsedTimeSecs() {
        long elapsed;
        if (running) {
            elapsed = ((System.currentTimeMillis() - startTime) / 1000);
        }
        else {
            elapsed = ((stopTime - startTime) / 1000);
        }
        return elapsed;
    }    
}

    
