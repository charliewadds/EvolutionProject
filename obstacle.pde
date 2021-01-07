class obstacle{
    float x;
    float y;
    float width;
    float height;
        obstacle(float x , float y, float width, float height){
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;




        }
        void show(){
            rectMode(CENTER);
            fill(255,0,0);
            rect(x,y,width,height);
            
            noFill();

        }

        boolean hit(float playerX, float playerY){
            
            if( (playerY>= y-(height/2)) && (playerY<=y+(height/2)) &&  (playerX>=x - (width/2))  &&  (playerX<= x + (width/2))){
                print("crash");
                return true;
            }
            return false;



        }




}