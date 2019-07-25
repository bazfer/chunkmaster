import consumer from "./consumer"

const path = window.location.pathname.split('/')
const room_id = path[2]

consumer.subscriptions.create(
  {
    channel: "RoomChannel",
    room_id: room_id
  },
  {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log('Room Connected')
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const roomContainer = document.getElementById('room-container')
      const message = document.createElement('div')
      message.innerHTML = `${data.message}`
      message.setAttribute("id", data.id)
      roomContainer.appendChild(message)
    }
  }
);
