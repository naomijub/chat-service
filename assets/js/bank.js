let BankService = {
    init(socket) {
      let channel = socket.channel('bank:lobby', {})
      channel.join()
      this.listenForChats(channel)
    },
  
    listenForChats(channel) {
      document.getElementById('chat-form').addEventListener('submit', function(e){
        e.preventDefault()
  
        let userName = document.getElementById('user-name').value
        let userMsg = document.getElementById('user-text').value
  
        channel.push('community', {user: userName, body: userMsg})
  
        document.getElementById('user-name').value = ''
        document.getElementById('user-text').value = ''
      })
  
      channel.on('community', payload => {
        let chatBox = document.querySelector('#chat-box')
        let msgBlock = document.createElement('p')
  
        msgBlock.insertAdjacentHTML('beforeend', `<b>${payload.user}:</b> ${payload.body}`)
        chatBox.appendChild(msgBlock)
      })
    }
  }
  
  export default BankService