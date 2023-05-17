# ------------------------------------------------------------------
#   Description       :      Common Configurations Used in Test Execution
#   Project           :      Systech360 Automation
#   Author            :      Nigel Powell
#   2020   Systech International.  All rights reserved
# ------------------------------------------------------------------
#
#   Prologue:
#   - NA
#
#   Epilogue:
#   - NA
Configuration = "TESTCFG"
Enabled_Disabled = "TESTCFGED"
if Configuration.upper() == "SVT_ADMIN":
    BROWSER == "chrome"
    LOGIN_URL == "https://eng-svt.systechcloud.net"
    UNISPHERE_URL == "https://eng-svt.systechcloud.net/Systech360/"
    UNICLOUD_URL == "http://athena.systechcloud.net:8008/UniCloud/"
    UNICLOUD_USER == "Automation"
    UNICLOUD_PASSWORD == "Test!234"
    BROWSERWIDTH == "1366"
    Browser_type == "chrome"
    Username == "AdminUser1"
    Password == "Test@101"
    URL == "https://eng-svt.systechcloud.net/Systech360/"