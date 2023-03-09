import consumer from "./consumer"

let resetFunc;
let timer = 0;

consumer.subscriptions.create("AppearenceChannel", {
  initialized() {},

  connected() {
    // Called when the subscription is ready for use on the server
    // this.perform("online");
    console.log("connected");
    resetFunc = () => this.resetTimer(this.uninstall);
    this.install();
    window.addEventListener("turbo:load", () => this.resetTimer());
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("disconnected");
    this.uninstall();
  },

  rejected() {},

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  online() {
    this.perform("online");
  },

  away() {
    this.perform("away");
  },

  offline() {
    this.perform("offline");
  },

  uninstall() {
    const shouldRun = document.getElementById('appearence_channel');
    window.removeEventListener("load", resetFunc);
    window.removeEventListener("DOMContentLoaded", resetFunc);
    window.removeEventListener("click", resetFunc);
    window.removeEventListener("keydown", resetFunc);
    if(!shouldRun){
      clearTimeout(timer);
      this.perform("offline");
    }
  },

  install() {
    console.log("install");

    window.addEventListener("load", resetFunc);
    window.addEventListener("DOMContentLoaded", resetFunc);
    window.addEventListener("click", resetFunc);
    window.addEventListener("keydown", resetFunc);
    this.resetTimer();
  },

  resetTimer() {
    this.uninstall();
    const shouldRun = document.getElementById('appearence_channel');
    if(!!shouldRun){
      this.online()
      clearTimeout(timer);
      const timeInSeconds = 5;
      const miliseconds = 1000;
      const timeInMiliseconds = timeInSeconds * miliseconds;

      timer = setTimeout(this.away.bind(this), timeInMiliseconds);
    }
  },
});
