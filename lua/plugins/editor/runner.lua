return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			mode = "term", -- "term", "float", or "tab"
			focus = true,
			startinsert = true,
			term = {
				position = "belowright",
				size = 15,
			},
			float = {
				border = "rounded",
				width = 0.8,
				height = 0.8,
				x = 0.5,
				y = 0.5,
				border_hl = "FloatBorder",
				float_hl = "Normal",
				blend = 0,
			},
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				javascript = "node",
				c = {
					"cd $dir &&",
					"gcc $fileName -o $fileNameWithoutExt &&",
					"./$fileNameWithoutExt",
				},
				cpp = {
					"cd $dir &&",
					"g++ $fileName -o $fileNameWithoutExt &&",
					"./$fileNameWithoutExt",
				},
				rust = {
					"cd $dir &&",
					"cargo -q run",
				},
				go = "go run",
				sh = "bash",
			},
		})
	end,
}
