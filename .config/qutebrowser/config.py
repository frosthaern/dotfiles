import pywalQute.draw

config.load_autoconfig()

pywalQute.draw.color(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8,
    }
})

c.fonts.default_family = ["JetBrainsMono Nerd Font Mono Bold"]
c.fonts.default_size = "13pt"
c.fonts.completion.category = 'bold 10pt JetBrainsMono Nerd Font Mono'
c.fonts.completion.entry = 'bold 10pt JetBrainsMono Nerd Font Mono'
c.fonts.statusbar = 'bold 12pt JetBrainsMono Nerd Font Mono'
c.fonts.tabs.selected = 'bold 13pt JetBrainsMono Nerd Font Mono'
c.fonts.tabs.unselected = '13pt JetBrainsMono Nerd Font Mono'
