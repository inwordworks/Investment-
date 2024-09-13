// Inside firebase-messaging-sw.js
importScripts('https://www.gstatic.com/firebasejs/9.17.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.17.1/firebase-messaging-compat.js');

const firebaseConfig = {
    apiKey: "AIzaSyBXUeCnuLIf1TC6eo7LhVUdMhdaC1J7HDk",
    authDomain: "ahtesham-1988.firebaseapp.com",
    projectId: "ahtesham-1988",
    storageBucket: "ahtesham-1988.appspot.com",
    messagingSenderId: "1000552216526",
    appId: "1:1000552216526:web:8a407675d743c03dad9d9f",
    measurementId: "G-9TSGJKRLXD"
};

// Initialize Firebase in the service worker
firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage((payload) => {
    const title = payload.notification.title;
    const options = {
        body: payload.notification.body,
        icon: payload.notification.icon,
    };
    self.registration.showNotification(title, options);
});
