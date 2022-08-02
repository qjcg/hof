package cmd

import (
	"fmt"
	"os"

	"path/filepath"

	"github.com/spf13/cobra"

	"github.com/hofstadter-io/hof/cmd/hof/cmd/fmt"
	"github.com/hofstadter-io/hof/cmd/hof/flags"

	hfmt "github.com/hofstadter-io/hof/lib/fmt"
)

var fmtLong = `With hof fmt, you can
  1. format any language from a single tool
  2. run formatters as api servers for IDEs and hof
  3. manage the underlying formatter containers`

func init() {

	FmtCmd.Flags().BoolVarP(&(flags.FmtFlags.Data), "data", "d", false, "include cue,yaml,json,toml,xml files")
}

func FmtRun(files []string) (err error) {

	// you can safely comment this print out
	// fmt.Println("not implemented")

	err = hfmt.Run(files, flags.RootPflags, flags.FmtFlags)

	return err
}

var FmtCmd = &cobra.Command{

	Use: "fmt [filepaths or globs]",

	Short: "format any code and manage the formatters",

	Long: fmtLong,

	ValidArgsFunction: func(cmd *cobra.Command, args []string, toComplete string) ([]string, cobra.ShellCompDirective) {
		glob := toComplete + "*"
		matches, _ := filepath.Glob(glob)
		return matches, cobra.ShellCompDirectiveDefault
	},

	Run: func(cmd *cobra.Command, args []string) {
		var err error

		// Argument Parsing

		if 0 >= len(args) {
			fmt.Println("missing required argument: 'files'")
			cmd.Usage()
			os.Exit(1)
		}

		var files []string

		if 0 < len(args) {

			files = args[0:]

		}

		err = FmtRun(files)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	},
}

func init() {
	extra := func(cmd *cobra.Command) bool {

		return false
	}

	ohelp := FmtCmd.HelpFunc()
	ousage := FmtCmd.UsageFunc()
	help := func(cmd *cobra.Command, args []string) {
		if extra(cmd) {
			return
		}
		ohelp(cmd, args)
	}
	usage := func(cmd *cobra.Command) error {
		if extra(cmd) {
			return nil
		}
		return ousage(cmd)
	}

	FmtCmd.SetHelpFunc(help)
	FmtCmd.SetUsageFunc(usage)

	FmtCmd.AddCommand(cmdfmt.InfoCmd)
	FmtCmd.AddCommand(cmdfmt.PullCmd)
	FmtCmd.AddCommand(cmdfmt.StartCmd)
	FmtCmd.AddCommand(cmdfmt.StopCmd)

}
