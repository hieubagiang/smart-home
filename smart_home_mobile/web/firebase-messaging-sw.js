importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyAL5ny2VfknzcdNnWwY8gP4OEsXxx820fU",
    authDomain: "smart-home-1d42f.firebaseapp.com",
    projectId: "smart-home-1d42f",
    storageBucket: "smart-home-1d42f.appspot.com",
    messagingSenderId: "261934191224",
    appId: "1:261934191224:web:6116032758b99833a9138d",
    measurementId: "G-TW5NZNJ9GY"
});

const messaging = firebase.messaging();

//messaging.requestPermission();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});


self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});