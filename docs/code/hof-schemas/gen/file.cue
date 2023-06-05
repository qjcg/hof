package gen

// A file which should be generated by hof
File: {

	// The local input data, any struct
	// The Generator.In will be merged here
	//   but will not replace any values set locally
	In?: {...} // for templates

	// local override if the generator is set the opposite way
	applyGenInToOut: bool | *true

	// note, how In gets combined may be opaque, and non-CUEish
	// we should think about applying it at the schema level

	// input value for data files, always remains a CUE value
	Val?: _ // for datafiles

	// The full path under the output location
	// empty implies don't generate, even though it may end up in the out list
	// Support infering DatafileFormat by matching extensions
	Filepath?: string

	// Only one of these three may be set
	// The template contents
	TemplateContent?: string
	// Path into the loaded templates
	TemplatePath?: string

	// Writes a datafile, bypassing template rendering
	// You only have to set this when hof cannot infer from the file extension
	DatafileFormat?: "cue" | "json" | "yaml" | "xml" | "toml"

	// TODO, we would like to make the above a disjunction (multi-field)
	// but it results in a significant slowdown 50-100% for hof self-gen
	// Most likely need to wait for structural sharing to land in cue

	// CUE settings
	// for data files which need a package or namespace at the beginning
	Package:        string | *""
	Raw:            bool | *false
	Final:          bool | *false
	Concrete:       bool | *true
	Definitions:    bool | *true
	Optional:       bool | *true
	Hidden:         bool | *true
	Attributes:     bool | *true
	Docs:           bool | *true
	InlineImports:  bool | *false
	ErrorsAsValues: bool | *false

	// Alternative Template Delimiters
	Delims:          #TemplateDelims
	TemplateDelims?: Delims

	// Formatting Control
	Formatting?: {
		Disabled?: bool
		// Name of the formatter, like 'prettier' or 'black'
		Formatter: string
		// formatter specific configuration
		Config: _
	}

	// Note, intentionally closed to prevent user error when creating GenFiles
}

// deprecated
#File:             File
#HofGeneratorFile: File
