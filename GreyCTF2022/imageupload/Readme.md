# ImageUpload
> Author: Nguyen Quang Vinh

This challenge is about inspecting a network dump from a Wireshark dump file. Opening Wireshark to analyse the `dump.pcap` file, we can filter out the `http` protocol (as image uploading is essentially a `POST` request to an endpoint).

<img src="https://i.imgur.com/qRCnNLC.png">

Inspecting the `POST` request, we should see the content of the flag in the Textual data recorded in the payload.