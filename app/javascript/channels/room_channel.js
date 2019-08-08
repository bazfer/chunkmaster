import consumer from './consumer'

// tightly coupled to the current path but after many different tries this is what got it done
const path = window.location.pathname.split('/')
const room_id = path[2]

consumer.subscriptions.create(
  {
    channel: 'RoomChannel',
    room_id: room_id
  },
  {
    connected() {
    },

    disconnected() {
      this.perform('unsubscribed')
    },

    received(data) {
      const roomContainer = document.getElementById('room-container')
      const message = document.createElement('li')
      message.innerHTML = data.message
      message.setAttribute('id', data.id)
      roomContainer.appendChild(message)
    }
  }
);
