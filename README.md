# Webitel Portal SDK

## Features

List the key features and functionalities:

- Feature 1: Send messages

- Feature 2: Listen to incoming/upcoming messages

- Feature 3: Fetch messages/updates

- Feature 4: Send/Receive files

## Usage

### Auth
Login user:
`await WebitelPortalSdk.instance.login();`

Logout user and disable push notifications:
`await WebitelPortalSdk.instance.logout();`

Register device for push notifications:
`await WebitelPortalSdk.instance.registerDevice();`

### Channel & Connect Status listeners
Get Channel:
`final channel = await WebitelPortalSdk.instance.getChannel();`

Listen to changes in channel status:
`channel.onChannelStatusChange.listen...`

Listen to changes in connect status:
`channel.onConnectStreamStatusChange.listen...`

### Dialogs
Fetch dialog:
`final dialog = await WebitelPortalSdk.instance.fetchServiceDialog();`


Send message or message with media to dialog:
`await dialog.sendMessage();`

Fetch messages | set limit/offset for dialog:
`await dialog.fetchMessages();`

Fetch updates | set limit/offset (reversed to **fetchMessages**) for dialog:
`await dialog.fetchUpdates();`

Listen to upcoming/incoming messages in dialog:
`await dialog.listenToMessages();`

