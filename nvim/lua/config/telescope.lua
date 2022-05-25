require('telescope').setup{
  defaults = {
          theme = "ivy",
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    marks = {
      theme = "ivy",
    },
    oldfiles = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
    registers = {
      theme = "ivy",
    },
    diagnostics = {
      theme = "ivy",
    },
  },
 extensions = {
    project = {
      hidden_files = true, -- default: false
      theme = "ivy",
    },
    file_browser = {
            theme = "ivy",
    },
  }
}

require('telescope').load_extension('file_browser')
