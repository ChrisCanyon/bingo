# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.bingo-button').click ->
    return if this.id.split('/')[1] == '12'
    url = encodeURI("https://knoxbrewbingo.herokuapp.com/boards/" + this.id)

    method = 'POST'
    postData = ''
    shouldBeAsync = true
    request = new XMLHttpRequest

    handle_response = ->
      check_bingo = ->
        rows = document.getElementById('bingo-board').children[0].children
        console.log rows
        i = 0
        while i < 5
          bingo = true
          j = 0
          while j < 5
            if rows[i].children[j].children[0].style.backgroundColor != 'lightgreen'
              bingo = false
            j++
          if bingo
            alert 'Bingo!'
            return
          i++

        i = 0
        while i < 5
          bingo = true
          j = 0
          while j < 5
            if rows[j].children[i].children[0].style.backgroundColor != 'lightgreen'
              bingo = false
            j++
          if bingo
            alert 'Bingo!'
            return
          i++

        bingo = true
        i = 0
        while i < 5
          if rows[i].children[i].children[0].style.backgroundColor != 'lightgreen'
            bingo = false
          i++
        if bingo
          alert 'Bingo!'
          return

        bingo = true
        i = 0
        while i < 5
          if rows[i].children[4 - i].children[0].style.backgroundColor != 'lightgreen'
            bingo = false
          i++
        if bingo
          alert 'Bingo!'
          return

      status = request.status
      data = request.responseText
      console.log status
      if status == 204
        x = decodeURI(request.responseURL).split('/')
        space = document.getElementById(x[4] + '/' + x[5])
        if space.style.backgroundColor == 'lightgreen'
          space.style.backgroundColor = 'white'
        else
          space.style.backgroundColor = 'lightgreen'
          check_bingo()

    $.post(url,'', handle_response())
    # request.open(method, url, shouldBeAsync)
    # request.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    # request.send(postData)
