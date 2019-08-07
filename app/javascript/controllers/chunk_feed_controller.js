import { Controller } from 'stimulus'
import consumer from '../channels/consumer'
import baseChunk from '../shared/base_chunk'

const cable = consumer
const chunk_feed = document.getElementById("chunk-feed-id")
const base = baseChunk


export default class extends Controller {

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
          // if (data.completed_at) {
          //   self.statusTarget.innerText = "Chunk Completed!"
          //   self.element.classList.remove("active-chunk", "active-chunk--visible")
          //   location.reload();
          // } else {
          //   self.element.classList.add(["active-chunk", "active-chunk--visible"])
          // }
        }
      }
    )
  }

  create() {
    // add code to create active chunk but don't use 'active chunk' for identification
    // instead use indexes -- other wise a lot of CSS maneuvering needs to be done
    // after every chunk without reload

    const list = document.getElementById('chunk-feed-container')

    let chunk = document.createElement('li')
    let inner = base('XXX')
    chunk.innerHTML = inner
    console.log('complete')

    list.insertBefore(chunk, list.firstChild)
  }
}
