
import 'package:socket_io_client/socket_io_client.dart' as IO;


void main(){
  onInit();
}

onInit() {
  IO.Socket socket;
  print("Connecting to Socket.IO server...");
  socket = IO.io(
      'https://socket.hullu.in',
 // Set a longer timeout (in milliseconds)

  );

  socket.onConnect((_) {
    print('Connected to server');
    //  socket.emit('msg', 'test');
  });

  socket.on('2', (data) {
    print('Received data: $data');

  });




  socket.onDisconnect((_) {
    print('Disconnected from server');
  });



  socket.onError((error) {
    print('Error: $error');
  });
}