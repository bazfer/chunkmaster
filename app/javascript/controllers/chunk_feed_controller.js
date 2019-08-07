import { Controller } from 'stimulus'
import consumer from '../channels/consumer'
import chunkFactory from '../shared/chunk_factory'

const cable = consumer
const chunk_feed = document.getElementById("chunk-feed-id")

export default class extends Controller {
  static targets = [ "container", "title", "duration", "completion", "status" ]

  connect() {
    console.log('Chunk Feed Controller: Connected')
    let self = this
    cable.subscriptions.create(
      {
        channel: 'ChunkFeedChannel',
        chunk_feed_id: chunk_feed
      },
      {
        connected() {
          console.log('Chunk Feed: Established')
        },
        disconnected() {
          this.perform('unsubscribed')
          console.log('Chunk Feed: Terminated')
        },
        received(data) {
          console.log('Chunk Feed: Incoming Chunk')
          if (data.completed_at) {
            self.statusTarget.innerText = "Chunk Completed!"
            self.completionTarget.innerHTML = "Completed at: "
          } else {

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
    chunk.id = 'last-chunk'
    list.insertBefore(chunk, list.firstChild)

    console.log('Chunk Created and Rendered')
  }
}
