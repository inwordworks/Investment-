
self.onnotificationclick = (event) => {
    console.log('self.onnotificationclick');
    if (event.notification.data.FCM_MSG.data.click_action) {
        console.log('event.notification.data.FCM_MSG.data.click_action');
        event.notification.close();
        event.waitUntil(clients.matchAll({
            type: 'window'
        }).then((clientList) => {
            console.log('clientList');
            for (const client of clientList) {
                if (client.url === '/' && 'focus' in client)
                    return client.focus();
            }
            if (clients.openWindow)
                return clients.openWindow(event.notification.data.FCM_MSG.data.click_action);
        }));
    }
};
importScripts('https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.3.2/firebase-messaging.js');

const firebaseConfig = {
    apiKey: "AIzaSyBXUeCnuLIf1TC6eo7LhVUdMhdaC1J7HDk",
    authDomain: "ahtesham-1988.firebaseapp.com",
    projectId: "ahtesham-1988",
    storageBucket: "ahtesham-1988.appspot.com",
    messagingSenderId: "1000552216526",
    appId: "1:1000552216526:web:8a407675d743c03dad9d9f",
    measurementId: "G-9TSGJKRLXD"
};

const app = firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    console.log('messaging.setBackgroundMessageHandler');
    if (payload.notification.background && payload.notification.background == 1) {
        const title = payload.notification.title;
        const options = {
            body: payload.notification.body,
            icon: payload.notification.icon,
        };
        return self.registration.showNotification(
            title,
            options,
        );
    }
});
