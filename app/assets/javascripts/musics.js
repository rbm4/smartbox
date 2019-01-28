
//= require jquery3


$(document).ready(function() {
    let player2 = $('#player');
    console.log(player2);
    var player = new Plyr('#player');
    player.autoplay = true;
    player.enabled = false;

    setInterval(function(){
        player.volume = 1;
        // esta tocando?
        console.log(player.playing)
        if (player.playing){
            console.log("playing")
        } else {
            if (player.ended){
                console.log("not playing, finished, load other")
                let currentId = $("#properties").data('id');
                console.log(currentId)
                $.ajax({
                    type: "POST",
                    url: `/nextMusic/${currentId}`,
                    success: function () {
                        player = new Plyr('#player');
                    }
                });
            } else {
                // .play().catch(function(reason){
                //     console.log(reason)
                //     player.enabled = true;
                // })
                console.log("not playing")

                let promise = player.play();

                if (promise !== undefined) {
                    promise.then(_ => {
                        console.log("started")
                    }).catch(error => {
                        console.log(error)
                    });
                }
            }
        }


    },5000)
});