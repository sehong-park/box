# facebook.coffee
# http://blog.barouhandpartners.com/how-to-add-facebook-like-button-that-works-with-turbolinks/
class @Facebook

    rootElement = null
    eventsBound = false

    @load: ->
        unless $('#fb-root').size() > 0
            initialRoot = $('<div>').attr('id', 'fb-root')
            $('body').prepend initialRoot

        unless $('#facebook-jssdk').size() > 0
            facebookScript = document.createElement("script")
            facebookScript.id = 'facebook-jssdk'
            facebookScript.async = 1
            facebookScript.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=#{Facebook.appId()}&version=v2.0"

            firstScript = document.getElementsByTagName("script")[0]
            firstScript.parentNode.insertBefore facebookScript, firstScript

        Facebook.bindEvents() unless Facebook.eventsBound

    @bindEvents = ->
        if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
            $(document)
                .on('page:fetch', Facebook.saveRoot)
                .on('page:change', Facebook.restoreRoot)
                .on('page:change', Facebook.signIn)
                .on('page:change', Facebook.signOut)
                .on('page:load', ->
                    FB?.XFBML.parse()
                )

        Facebook.eventsBound = true
  
    @singIn = ->
        $('#sign_in').click (e) ->
            e.preventDefault()
            FB.login (response) ->
                window.location = '/auth/facebook/callback' if response.authResponse
                  
    @signOut = ->
        $('#sign_out').click (e) ->
            FB.getLoginStatus (response) ->
                FB.logout() if response.authResponse
            true
            
    @saveRoot = ->
        Facebook.rootElement = $('#fb-root').detach()

    @restoreRoot = ->
        if $('#fb-root').length > 0
            $('#fb-root').replaceWith Facebook.rootElement
        else
            $('body').append Facebook.rootElement

    @appId = ->
        '910064432355300'

Facebook.load()