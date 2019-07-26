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

      var feedContainer, lastChunk, chunk
      feedContainer = document.getElementById('chunk-feed-container')
      lastChunk = document.getElementById('chunk-feed-container').firstElementChild
      chunk = document.createElement('li')

      chunk.innerHTML = data.title

      chunk.setAttribute('id', data.id)
      feedContainer.insertBefore(chunk, lastChunk)
    }
  }
)
