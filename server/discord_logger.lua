-- Function used to send a log message to discord
function sendDiscordLog(message)
    if not Config.EnableDiscordLogging then return end -- Checks to see if enabled

    -- Get the current timestamp with the correct format
    local timestamp = os.date('%Y-%m-%d %H:%M:%S')  -- Correct date format

    -- Use the Discord Webhook URL from the config file
    local webhookUrl = Config.DiscordWebhookURL

    -- Perform the HTTP request to send the log to Discord
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({
        username = "Smite Logger",  -- Name of the logger
        embeds = {
            {
                ["color"] = 16711680, -- Red Color
                ["title"] = "Smite Command Used",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "Timestamp: " .. timestamp,  -- Correct timestamp
                }
            }
        }
    }), {['Content-Type'] = 'application/json' })
end
