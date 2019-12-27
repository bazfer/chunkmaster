import { Controller } from 'stimulus'
import consumer from '../channels/consumer'
import chunkFactory from '../shared/chunk_factory'

const cable = consumer
const chunk_feed = document.getElementById("chunk-feed-id")

export default class extends Controller {
  static targets = [ "container", "title", "duration", "completion", "chunkStatus", "userStatus", "newChunk" ]

  connect() {
    const self = this
    cable.subscriptions.create(
      {
        channel: 'ChunkFeedChannel',
        chunk_feed_id: chunk_feed
      },
      {
        connected() {
        },
        disconnected() {
          this.perform('unsubscribed')
        },
        received(data) {
          if (data.completed_at) {
            self.chunkStatusTarget.innerHTML = "Chunk Completed!"
            self.completionTarget.innerHTML = "Completed at: "
            self.newChunkTarget.setAttribute("style", "display: block;")
            self.userStatusTarget.setAttribute("style", "display: none;")
          }
        }
      }
    )
  }

  create() {
    // need to add frontend validations for chunk data (missing data, etc.)

    const list = this.containerTarget
    const chunk = document.createElement('li')
    const content = chunkFactory({ title: this.titleTarget.value, duration: this.durationTarget.value })

    chunk.innerHTML = content
    chunk.classList.add('chunk')
    list.insertBefore(chunk, list.firstChild)
    this.newChunkTarget.setAttribute("style", "display: none;")
    this.userStatusTarget.setAttribute("style", "display: block;")
  }
}
