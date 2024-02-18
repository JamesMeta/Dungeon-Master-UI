function playAudio(audioId) {
    var audio = document.getElementById(audioId);
    if (audio.paused) {
      audio.play();
    } else {
      audio.pause();
      audio.currentTime = 0; // Reset audio to beginning
    }
  }