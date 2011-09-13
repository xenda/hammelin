import org.jfugue.*; 
public class Main 
{ 
    public static void main(String[] args) 
    { 
        Player player = new Player(); 
        // Pattern pattern = new Pattern("C D E F G A B"); 
        Pattern pattern = new Pattern("G B C D E A B"); 
        
        player.play(pattern); 
        System.exit(0); // If using Java 1.4 or lower
    } 
} 