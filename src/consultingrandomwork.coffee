# Description
#   A hubot scrip that shows some random consulting work - as collected by www.consultingrandomworkgenerator.com
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot consulting work - will print the URL of some random consulting work
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Till Kothe[@kreditech.com]

module.exports = (robot) ->
  robot.hear /consult(ing|ants?) (work|advice|task)/i, (res) ->
    robot.http('http://www.consultingrandomworkgenerator.com/')
      .get() (err, response, body) ->
        if err
          res.reply "Encountered an error :( #{err}"
          return
        memeurl = 'http://www.consultingrandomworkgenerator.com/' + body.replace /[\s\S]*(images\/memes\/.*jpg)[\s\S]*/, '$1'
        res.reply "Here's what our expert consultant suggests:\n" + memeurl
