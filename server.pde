
import processing.net.*;
Server server;
void setup() {
  server = new Server(this, 5555);
  println("start server at address: " + server.ip());
}
void draw() {
  //いずれかのクライアントclientがデータを送ってきたときそのclientを取得できる
  Client c = server.available();
  if (c != null) {
    //送ってきた文字列を取得
    String s = c.readStringUntil('\n').trim();
    println("received:" + s);
    String[] data = s.split(",");
    int x = parseInt(data[0]);
    int y = parseInt(data[1]);
    //接続しているclient全員にデータを送る
    server.write(x + "," + y + '\n');
    ellipse(x, y, 5, 5);
  }
}