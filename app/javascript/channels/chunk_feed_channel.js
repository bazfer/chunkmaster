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

      let feedContainer = document.getElementById('chunk-feed-container')
      let lastChunk = document.getElementById('chunk-feed-container').firstElementChild
      let chunkContainer = document.createElement('li')

      let chunk = `<div>
                      <div>Title: ${data.title} </div>
                      <div>Started at: ${data.created_at} </div>
                      <div>Duration: ${data.duration}</div>
                  </div>`

      chunkContainer.innerHTML = chunk

      chunkContainer.setAttribute('id', data.id)
      feedContainer.insertBefore(chunkContainer, lastChunk)
    }
  }
)
