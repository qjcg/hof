package functions

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var deleteLong = `Delete a Studios function.`

var DeleteCmd = &cobra.Command{

	Use: "delete <name or id>",

	Short: "Delete a Studios function.",

	Long: deleteLong,

	Run: func(cmd *cobra.Command, args []string) {

		// Argument Parsing

		if 0 >= len(args) {
			fmt.Println("missing required argument: 'Ident'")
			cmd.Usage()
			os.Exit(1)
		}

		var ident string

		if 0 < len(args) {

			ident = args[0]

		}

		// Default body

		fmt.Println("hof studios functions delete", ident)

	},
}
