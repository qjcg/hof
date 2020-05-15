package design

import (
	"github.com/hofstadter-io/hofmod-cli/schema"
)

#CliPflags: [...schema.#Flag] & [
  {
    Name:    "config"
    Long:    "config"
    Short:   "C"
    Type:    "string"
    Default: ""
    Help:    "Path to a hof configuration file"
  },
  {
    Name:    "account"
    Long:    "account"
    Short:   "A"
    Type:    "string"
    Default: ""
    Help:    "the account context to use during this hof execution"
  },
  {
    Name:    "billing"
    Long:    "billing"
    Short:   "B"
    Type:    "string"
    Default: ""
    Help:    "the billing context to use during this hof execution"
  },
  {
    Name:    "project"
    Long:    "project"
    Short:   "P"
    Type:    "string"
    Default: ""
    Help:    "the project context to use during this hof execution"
  },
	{
		Name:    "labels"
		Long:    "label"
		Short:   "L"
		Type:    "[]string"
		Default: "nil"
		Help:    "Labels for use across all commands"
	},
  {
    Name:    "verbosity"
    Long:    "verbosity"
    Short:   "v"
    Type:    "string"
    Default: ""
    Help:    "set the verbosity of output"
  },
  {
    Name:    "quiet"
    Long:    "quiet"
    Short:   "q"
    Type:    "string"
    Default: ""
    Help:    "turn off output and assume defaults at prompts"
  },
  {
    Name:    "impersonate-account"
    Long:    "impersonate-account"
    Short:   "I"
    Type:    "string"
    Default: ""
    Help:    "account to impersonate for this hof execution, relies on having permission to impersonate and avoids need for credentials"
  },
  {
    Name:    "trace-token"
    Long:    "trace-token"
    Short:   ""
    Type:    "string"
    Default: ""
    Help:    "used to help debug issues"
  },
  {
    Name:    "log-http"
    Long:    "log-http"
    Short:   ""
    Type:    "string"
    Default: ""
    Help:    "used to help debug issues"
  },
]

