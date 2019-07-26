import consumer from './consumer'

consumer.subscriptions.create(
  {
    channel: 'ChunkFeedChannel',
    chunk_feed_id: 1
  },
  {
    connected() {
      console.log('Chunk Feed Established')
    },
    disconnected() {
      this.perform('unsubscribed')
    },
    received(data) {
      console.log('Incoming Chunk')

      var feedContainer, chunk
      feedContainer = document.getElementById('chunk-feed-container')
      chunk = document.createElement('div')
      console.log(data)

      chunk.innerHTML = data.title
      chunk.setAttribute('id', data.id)
      feedContainer.appendChild(chunk)
    }
  }
)
