const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);

app.get('/notify', (req, res) => {
  io.emit('notify');
  res.send({ 200: "success" })
});

io.on('connection', (socket) => {
  console.log('a user connected');
});

http.listen(3030, () => {
  console.log('listening on *:3030');
});
