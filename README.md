# Webitel Portal SDK

## Features

List the key features and functionalities:

- Feature 1: Send messages

- Feature 2: Listen to incoming/upcoming messages

- Feature 3: Fetch messages/updates

- Feature 4: Send/Receive files

## Usage

Handlers:

1. AuthHandler
2. ChatListHandler
3. MessageHandler
4. PortalHandler

for using handler `WebitelPortalSdk.instance.[handlerName]`

### Auth
Login user
`WebitelPortalSdk.instance.authHandler.login();`

Logout user and disable push notifications
`WebitelPortalSdk.instance.authHandler.logout();`

Register device for push notifications
`WebitelPortalSdk.instance.authHandler.registerDevice();`

### ChatList
Fetch dialogs
`WebitelPortalSdk.instance.chatListHandler.fetchDialogs();`

Enter Chat
`WebitelPortalSdk.instance.chatListHandler.enterChat();`

Exit Chat
`WebitelPortalSdk.instance.chatListHandler.exitChat();`

### MessageHandler
Send message or message with media
`WebitelPortalSdk.instance.messageHandler.sendMessage();`

Fetch messages | set limit/offset
`WebitelPortalSdk.instance.messageHandler.fetchMessages();`

Fetch updates | set limit/offset(reversed to **fetchMessages**)
`WebitelPortalSdk.instance.messageHandler.fetchUpdates();`

Listen to upcoming/incoming messages
`WebitelPortalSdk.instance.messageHandler.listenToMessages();`

