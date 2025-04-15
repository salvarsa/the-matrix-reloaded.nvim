local hsluv = require("the_matrix_reloaded.hsluv")
local theme_util = require("the_matrix_reloaded.theme")

local util = {}

util.colorsUsed = {}
util.colorCache = {}

util.bg = "#000000"
util.fg = "#ffffff"
util.day_brightness = 0.3

-- Funciones auxiliares
local function hexToRgb(hex_str)
    local hex = "[abcdef0-9][abcdef0-9]"
    local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

    local r, g, b = string.match(hex_str, pat)
    return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function util.blend(fg, bg, alpha)
    bg = hexToRgb(bg)
    fg = hexToRgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5
    end

    return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

-- Resto de funciones auxiliares (darken, lighten, etc.)...

-- Función highlight corregida
function util.highlight(group, color)
    if color.fg then util.colorsUsed[color.fg] = true end
    if color.bg then util.colorsUsed[color.bg] = true end
    if color.sp then util.colorsUsed[color.sp] = true end

    if color.link then
        vim.cmd("highlight! link " .. group .. " " .. color.link)
    else
        local data = {}
        if color.fg then data.fg = color.fg end
        if color.bg then data.bg = color.bg end
        if color.sp then data.sp = color.sp end

        -- Manejo de estilos corregido
        if color.style and not (color.style == "NONE") then
            if type(color.style) == "string" then
                for _, style in ipairs(vim.split(color.style, ",")) do
                    data[style:trim()] = true
                end
            elseif type(color.style) == "table" then
                for _, style in ipairs(color.style) do
                    data[style] = true
                end
            end
        end

        vim.api.nvim_set_hl(0, group, data)
    end
end

function util.syntax(syntax)
    for group, colors in pairs(syntax) do
        util.highlight(group, colors)
    end
end

function util.load(theme)
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "the_matrix_reloaded"
    
    util.syntax(theme.base)

    vim.defer_fn(function()
        if theme.defer then
            util.syntax(theme.defer)
        end
    end, 100)
end

return util