import consumer from "./consumer"

const pathArray = window.location.pathname.split('/')
const secondLevelLocation = pathArray[2]

consumer.subscriptions.create(
  {
    channel: "RoomChannel",
    room_id: secondLevelLocation
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
      console.log(data)
    }
  }
);
