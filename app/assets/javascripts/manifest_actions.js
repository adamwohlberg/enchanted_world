$(document).ready(function(){
  window.addEventListener('appinstalled', evt =>  {
    console.log('The app was installed');
  });
});


$(document).ready(function(){
  // window.addEventListener('beforeinstallprompt'), evt => {
  //   // prevents the install to homepage until later
  //   evt.preventDefaut();
  //   // save the event for later
  //   promptEvt = evt;
  //   return false;
  //   });
});

$(document).ready(function(){
 // if (promptEvt !== undefined) {
 //  // show install banner now that you stored earlier
 //  promptEvt.prompt();

 //  promptEvt.userChoice.then(choice => {
 //    console.log('User choice: ', choice.outcome);
 //  });
 // }
});