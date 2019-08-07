const addMinutes = (date, minutes) => {
  return new Date(date.getTime() + minutes*60000)
}

const chunkFactory = (data) => {
  const chunk = `<div>
    <div><span>Title: </span><span>${data.title}</span></div>
    <div><span>Started at: </span><span>${(new Date).toUTCString()}</span></div>
    <div><span>Duration: </span><span>${data.duration}</span></div>
    <div><span>Completion at: </span><span>${addMinutes(new Date, data.duration).toUTCString()}</span></div>
  </div>`
  return chunk
}

export default chunkFactory
