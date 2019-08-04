import { Controller } from "stimulus"
import consumer from '../channels/consumer'

const cable = consumer
const chunk_feed_id = document.getElementById("chunk-feed-id")

export default class extends Controller {
  static targets = [ "completion_at", "title", "started_at", "duration", "status" ]

  initialize() {
  }

  connect() {
    console.log('Active Chunk Controller: Connected')
    let controller = this
    cable.subscriptions.create(
      {
        channel: 'ChunkFeedChannel',
        chunk_feed_id: chunk_feed_id
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
            controller.statusTarget.innerText = "Chunk Completed!"
            controller.element.classList.remove("active-chunk", "active-chunk--visible")
            location.reload();
          } else {
            controller.element.classList.add(["active-chunk", "active-chunk--visible"])
          }
        }
      }
    )
  }

  start() {
    const activeChunk = document.getElementById('active-chunk')
  }
}
