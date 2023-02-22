// app/javascript/channels/chat_channel.js
import consumer from "./consumer"
alert(" I am chatchannel js")

consumer.subscriptions.create({ channel: "ChatChannel" }, {
  received(data) {
  	console.log("i received data!!!!")
    console.log(data)
    alert(data)
    $('#your-message').append('<tr ><td style="width:150px"></td><td class="background-color">'+data.message.description+'</td><td class="">'+data.message.created_at+'</td></tr>'); 
  },

  connected(data) {
    console.log("connected!!!!")
  }

})
console.log(consumer.subscriptions)



