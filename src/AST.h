#ifndef CHIMERA_AST_H
#define CHIMERA_AST_H
#include <functional>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

/**
 * @enum PortDir
 * @brief Enumeration of the direction of the ports.
 */
enum class PortDir : unsigned short {
  INPUT = 0,
  OUTPUT = 1,
  INOUT = 2,
  NONE = 3
};

/**
 * @enum NodeType
 * @brief Enumeration of node types used in the AST.
 */
enum class NodeType {
  TERMINAL,
  BASE_NODE,
  SEQUENCE_DELAY_RANGE_EXPR,
  PORT,
  SPECIFY_SIMPLE_PATH,
  EVENT_CONTROL,
  STRING_LITERAL,
  CHARGE_STRENGTH_OPT,
  DPI_IMPORT_EXPORT,
  FOR_INITIALIZATION_OPT,
  LIST_OF_PORT_IDENTIFIERS,
  NON_INTEGER_TYPE,
  PARAMETER_VALUE_RANGES_OPT,
  PACKAGE_ITEM_NO_PP,
  SEQUENCE_DELAY_REPETITION_LIST,
  ADD_EXPR,
  DPI_IMPORT_ITEM,
  TK_REALTIME,
  CASE_ITEM,
  PROPERTY_IF_ELSE_EXPR,
  NON_ANONYMOUS_INSTANTIATION_BASE,
  UNARY_EXPR,
  UNARY_OP,
  CLASS_ID,
  REFERENCE,
  CAST,
  TF_VARIABLE_IDENTIFIER_FIRST,
  TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  TYPE_OR_ID_ROOT,
  MODULE_OR_GENERATE_ITEM,
  MODULE_PARAMETER_PORT_LIST_TRAILING_COMMA,
  INSTANTIATION_TYPE,
  PARAMETERS,
  REFERENCE_OR_CALL_BASE,
  PARAM_TYPE_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  STRUCTURE_OR_ARRAY_PATTERN_KEY,
  PARAMETER_ASSIGN_LIST,
  DEFPARAM_ASSIGN_LIST,
  GENERATE_ITEM_LIST_OPT,
  TK_OCTDIGITS,
  SEQUENCE_EXPR_PRIMARY,
  LPVALUE,
  LABEL_OPT,
  ESCAPEDIDENTIFIER,
  GENERATE_ITEM,
  DATA_TYPE_PRIMITIVE,
  SPEC_REFERENCE_EVENT,
  UDP_INPUT_DECLARATION_LIST,
  NON_PORT_MODULE_ITEM,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_NON_ANSI,
  MODULE_PARAMETER_PORT_LIST_OPT,
  PROPERTY_PREFIX_EXPR,
  EXPR_PRIMARY_BRACES,
  POW_EXPR,
  FOR_INIT_DECL_OR_ASSIGN,
  UDP_INITIAL,
  TF_PORT_LIST_PAREN_OPT,
  STRUCT_DATA_TYPE,
  UDP_SEQU_ENTRY,
  NET_VARIABLE_OR_DECL_ASSIGN,
  PARAMETER_VALUE_BYNAME_LIST_TRAILING_COMMA,
  INC_OR_DEC_EXPRESSION,
  NET_TYPE,
  SELECT_DIMENSIONS_OPT,
  SPEC_POLARITY,
  MACRO_FORMAL_PARAMETER,
  STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION,
  FOR_STEP,
  SPECPARAM_LIST,
  TK_BINBASE,
  TK_STRINGLITERAL,
  VAR_OPT,
  IDENTIFIER_OPTIONAL_UNPACKED_DIMENSIONS,
  FUNCTION_ITEM_LIST,
  TYPE_DECLARATION,
  UDP_BODY,
  MUL_EXPR,
  PAR_BLOCK,
  KEYWORDIDENTIFIER,
  LOGEQ_EXPR,
  MODULE_COMMON_ITEM,
  PRIMITIVE_GATE_INSTANCE,
  DATA_TYPE_OR_IMPLICIT,
  TK_OCTBASE,
  SEQUENCE_EXPR,
  TK_HEXBASE,
  PROPERTY_EXPR,
  SEQ_BLOCK,
  TASK_ITEM,
  DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  SPECIFY_BLOCK,
  TK_DECNUMBER,
  TK_DECBASE,
  PROPERTY_IMPLICATION_EXPR,
  BIT_LOGIC_OPT,
  INTEGER_ATOM_TYPE,
  LIFETIME,
  ANY_ARGUMENT_LIST,
  DELAY_VALUE_LIST,
  MODULE_PORT_DECLARATION,
  JUMP_STATEMENT,
  DELAY_VALUE,
  SEQUENCE_OR_EXPR,
  MODULE_ATTRIBUTE_FOREIGN_OPT,
  TF_PORT_DIRECTION_OPT,
  TF_PORT_ITEM_EXPR_OPT,
  CONT_ASSIGN_LIST,
  ANY_ARGUMENT_LIST_TRAILING_COMMA,
  PROCEDURAL_CONTINUOUS_ASSIGNMENT,
  EXPRESSION_OR_DIST,
  MODULE_START,
  EXPR_PRIMARY_PARENS,
  OPEN_RANGE_LIST,
  UNARY_PREFIX_EXPR,
  DELAY_IDENTIFIER,
  LIST_OF_IDENTIFIERS_UNPACKED_DIMENSIONS,
  DELAY_SCOPE,
  ACTION_BLOCK,
  TRAILING_ASSIGN_OPT,
  CLASS_ITEM,
  ENUM_NAME_LIST_TRAILING_COMMA,
  UDP_PORT_LIST,
  EQUIV_IMPL_EXPR,
  CLASS_NEW,
  PORT_NET_TYPE,
  UNQUALIFIED_ID,
  BEGIN,
  SYSTEM_TF_CALL,
  PARAMETER_VALUE_BYNAME_LIST_ITEM_LAST,
  CONDITIONAL_GENERATE_CONSTRUCT,
  TIMESCALE_DIRECTIVE,
  PORT_EXPRESSION,
  UDP_SEQU_ENTRY_LIST,
  SYMBOL_OR_LABEL,
  SIMPLE_SEQUENCE_EXPR,
  SYSTEMTFIDENTIFIER,
  TK_UNBASEDNUMBER,
  DECL_DIMENSIONS_OPT,
  CLASS_ITEMS_OPT,
  ENUM_NAME,
  PARAMETER_VALUE_OPT,
  SPECIFY_EDGE_PATH,
  IMPLICIT_CLASS_HANDLE,
  MODULE_ITEM,
  STATEMENT_ITEM,
  TYPE_IDENTIFIER_FOLLOWED_BY_ID,
  METHOD_PROTOTYPE,
  TF_PORT_ITEM,
  BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST,
  ENDNEW_OPT,
  SPECIFY_ITEM_LIST_OPT,
  SPECIFY_SIMPLE_PATH_DECL,
  TK_RS_EQ,
  PACKAGE_IMPORT_ITEM_LIST,
  UDP_PORT_DECL,
  WITH_EXPRS_SUFFIX,
  GENERATE_REGION,
  CALL_BASE,
  ARRAY_LOCATOR_METHOD,
  PORT_DECLARATION_ANSI,
  BITAND_EXPR,
  RANGE_LIST_IN_BRACES,
  MODULE_PARAMETER_PORT_LIST_ITEM_LAST,
  HEX_BASED_NUMBER,
  HIERARCHY_EVENT_IDENTIFIER,
  LIST_OF_VARIABLE_DECL_ASSIGNMENTS,
  RANDOM_QUALIFIER_OPT,
  DRIVE_STRENGTH_OPT,
  TK_TIMELITERAL,
  VALUE_RANGE,
  EXPR_MINTYPMAX_GENERALIZED,
  POLARITY_OPERATOR,
  PACKAGE_ITEM,
  FOR_INITIALIZATION,
  ENUM_DATA_TYPE,
  BLOCKING_ASSIGNMENT,
  DELAY1,
  BASED_NUMBER,
  PROCEDURAL_TIMING_CONTROL_STATEMENT,
  BLOCK_ITEM_DECL,
  NET_VARIABLE_OR_DECL_ASSIGNS,
  TIME_LITERAL,
  FUNCTION_ITEM_DATA_DECLARATION,
  DECL_VARIABLE_DIMENSION,
  TF_PORT_LIST_OPT,
  ENDFUNCTION_LABEL_OPT,
  QUALIFIED_ID,
  IMMEDIATE_ASSERTION_STATEMENT,
  JOIN_KEYWORD,
  TK_BINDIGITS,
  EVENT_TRIGGER,
  DYNAMIC_ARRAY_NEW,
  MATCHES_EXPR,
  PORT_REFERENCE_LIST,
  ARRAY_REDUCTION_METHOD,
  BUILTIN_ARRAY_METHOD,
  PACKAGE_DECLARATION,
  ASSIGNMENT_PATTERN_EXPRESSION,
  DRIVE_STRENGTH,
  PORT_DECLARATION_NON_ANSI,
  MODULE_PARAMETER_PORT_LIST,
  VAR_TYPE,
  PARAMETER_OPT,
  MODULE_ITEM_LIST,
  GENERICIDENTIFIER,
  PACKAGE_ITEM_LIST_OPT,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_ANSI,
  DATA_TYPE_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  XOR_EXPR,
  DEC_BASED_NUMBER,
  LOOP_STATEMENT,
  DATA_DECLARATION_OR_MODULE_INSTANTIATION,
  UDP_COMB_ENTRY_LIST,
  BIT_LOGIC,
  REFERENCE_OR_CALL,
  LOCAL_ROOT,
  PORT_DIRECTION,
  VARIABLE_DECL_ASSIGNMENT,
  SPECIFY_EDGE_PATH_DECL,
  FUNCTION_PROTOTYPE,
  SEQUENCE_WITHIN_EXPR,
  EXPR_PRIMARY_NO_GROUPS,
  PARAMETER_VALUE_BYNAME,
  CASE_ANY,
  SPEC_NOTIFIER,
  BLOCK_ITEM_OR_STATEMENT_OR_NULL,
  SPECIFY_ITEM,
  ANY_PARAM_DECLARATION,
  TF_PORT_LIST_TRAILING_COMMA,
  STRUCT_UNION_MEMBER,
  ANY_PORT_LIST_POSITIONAL,
  DIR,
  LIFETIME_OPT,
  LIST_OF_IDENTIFIERS,
  EDGE_OPERATOR,
  TK_VIRTUAL_OPT,
  TIMEUNITS_DECLARATION,
  TF_ITEM_OR_STATEMENT_OR_NULL,
  PACKAGE_IMPORT_LIST,
  EXPR_PRIMARY,
  SIGNED_UNSIGNED_OPT,
  NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST,
  UDP_COMB_ENTRY,
  DELAY3,
  INC_OR_DEC_OR_PRIMARY_EXPR,
  PROCEDURAL_ASSERTION_STATEMENT,
  STRUCT_UNION_MEMBER_LIST,
  COMP_EXPR,
  POSTFIX_EXPRESSION,
  SYMBOLIDENTIFIER,
  UDP_INPUT_SYM,
  POS_NEG_NUMBER,
  SPECIFY_TERMINAL_DESCRIPTOR,
  SELECT_VARIABLE_DIMENSION,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_ANSI,
  GENERATE_CASE_ITEMS,
  DATA_TYPE_PRIMITIVE_SCALAR,
  TF_ITEM_OR_STATEMENT_OR_NULL_LIST,
  CONDITIONAL_STATEMENT,
  SPECPARAM_DECL,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_NON_ANSI,
  STATEMENT_OR_NULL_LIST,
  TASK_DECLARATION,
  DATA_DECLARATION_BASE,
  ANY_PORT_LIST_OPT,
  MACRONUMERICWIDTH,
  TRAILING_DECL_ASSIGNMENT_OPT,
  GATE_INSTANCE_OR_REGISTER_VARIABLE,
  BIND_INSTANTIATION,
  PACKAGE_IMPORT_DECLARATION,
  MODULE_PACKAGE_IMPORT_LIST_OPT,
  STRUCTURE_OR_ARRAY_PATTERN_EXPRESSION_LIST,
  EVENT_EXPRESSION_LIST,
  TK_RSS_EQ,
  IMPLEMENTS_INTERFACE_LIST_OPT,
  DELAY3_OPT,
  EXPR_MINTYPMAX_TRANS_SET,
  STATEMENT_OR_NULL,
  ENUM_NAME_LIST,
  SEQUENCE_UNARY_EXPR,
  PP_IDENTIFIER,
  SHIFT_EXPR,
  OCT_BASED_NUMBER,
  HIERARCHY_SEGMENT,
  NONBLOCKING_ASSIGNMENT,
  EXPRESSION_LIST_PROPER,
  GENERATE_IF,
  FUNCTION_ITEM,
  SCOPE_PREFIX,
  PRIMITIVE_GATE_INSTANCE_LIST,
  SIMPLE_IMMEDIATE_ASSERTION_STATEMENT,
  DESCRIPTION_LIST,
  DR_STRENGTH0,
  UNIQUE_PRIORITY_OPT,
  SPECPARAM,
  PORT_EXPRESSION_OPT,
  COND_EXPR,
  TK_REG_OPT,
  LOGOR_EXPR,
  DELAY3_OR_DRIVE_OPT,
  TF_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT,
  NET_DECL_ASSIGN,
  ALWAYS_ANY,
  LIST_OF_TF_VARIABLE_IDENTIFIERS,
  VAR_OR_NET_TYPE_OPT,
  TF_PORT_LIST_ITEM_LAST,
  TASK_DECLARATION_ID,
  INSTANTIATION_BASE,
  SEQUENCE_REPETITION_EXPR,
  TK_HEXDIGITS,
  NON_ANONYMOUS_GATE_INSTANCE_OR_REGISTER_VARIABLE,
  LOCALPARAM_ASSIGN,
  CLASS_ITEMS,
  EXPRESSION_IN_PARENS,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_TRAILING_COMMA_ANSI,
  PORT_REFERENCE,
  DIST_OPT,
  CASEEQ_EXPR,
  GENERATE_BLOCK,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_ITEM_LAST_NON_ANSI,
  ANY_ARGUMENT_LIST_ITEM_LAST,
  GATE_INSTANTIATION,
  CASTING_TYPE,
  EXPR_MINTYPMAX,
  CONTINUOUS_ASSIGN,
  PARAMETER_ASSIGN,
  DELAY_VALUE_SIMPLE,
  SWITCHTYPE,
  PACKAGE_OR_GENERATE_ITEM_DECLARATION,
  BIN_BASED_NUMBER,
  LOOP_GENERATE_CONSTRUCT,
  PARAMETER_OVERRIDE,
  UDP_PRIMITIVE,
  PARAMETER_EXPR,
  REPEAT_CONTROL,
  PACKED_SIGNING_OPT,
  EXPRESSION_OR_NULL_LIST_OPT,
  ENUM_NAME_LIST_ITEM_LAST,
  MACRO_FORMALS_LIST_OPT,
  SPEC_NOTIFIER_OPT,
  HIERARCHY_EXTENSION,
  GENERATE_ITEM_LIST,
  DATA_DECLARATION_MODIFIERS_OPT,
  SEQUENCE_THROUGHOUT_EXPR,
  PROPERTY_EXPR_OR_ASSIGNMENT_LIST,
  BITOR_EXPR,
  TF_PORT_LIST,
  ANY_PORT_LIST_TRAILING_COMMA_NAMED,
  FUNCTION_RETURN_TYPE_AND_ID,
  STATEMENT,
  DR_STRENGTH1,
  ASSIGN_MODIFY_STATEMENT,
  UDP_PORT_DECLS,
  INTEGER_VECTOR_TYPE,
  ASSIGNMENT_PATTERN,
  CLASS_CONSTRUCTOR,
  MODULE_PARAMETER_PORT,
  MODULE_OR_GENERATE_ITEM_DECLARATION,
  FINAL_CONSTRUCT,
  MEMBER_NAME,
  CLASS_DECLARATION,
  PACKAGE_IMPORT_ITEM,
  SIGNING,
  CLASS_CONSTRUCTOR_PROTOTYPE,
  GENERATE_CASE_ITEM,
  DATA_DECLARATION,
  EXPRESSION,
  CONT_ASSIGN,
  DELAY_OR_EVENT_CONTROL_OPT,
  BIND_DIRECTIVE,
  MISC_DIRECTIVE,
  UDP_INITIAL_EXPR_OPT,
  DESCRIPTION,
  DATA_TYPE_BASE,
  TRAILING_ASSIGN,
  MODULE_END,
  WAIT_STATEMENT,
  PACKAGE_ITEM_LIST,
  CASE_ITEMS,
  STATEMENT_OR_NULL_LIST_OPT,
  PORT_NAMED,
  UDP_OUTPUT_SYM,
  ASSIGNMENT_STATEMENT_NO_EXPR,
  ANY_PORT_LIST_ITEM_LAST_POSITIONAL,
  MODULE_ITEM_LIST_OPT,
  SEQUENCE_AND_EXPR,
  DATA_TYPE,
  ARGUMENT_LIST_OPT,
  FOR_STEP_OPT,
  SEQUENCE_INTERSECT_EXPR,
  FUNCTION_DECLARATION,
  NET_TYPE_OR_NONE,
  CLASS_DECLARATION_EXTENDS_OPT,
  BOOLEAN_ABBREV_OPT,
  SPECIFY_PATH_IDENTIFIERS,
  TF_PORT_DIRECTION,
  TK_DECDIGITS,
  END,
  NET_DECLARATION,
  TK_TAGGED_OPT,
  TK_XZDIGITS,
  GATETYPE,
  PREPROCESS_INCLUDE_ARGUMENT,
  MACRO_FORMALS_LIST,
  CONST_OPT,
  LOGAND_EXPR,
  EVENT_EXPRESSION,
  UDP_ENTRY_LIST,
  PREPROCESSOR_ACTION,
  TF_PORT_DECLARATION,
  UDP_INIT_OPT,
  TYPE_IDENTIFIER_OR_IMPLICIT_FOLLOWED_BY_ID_AND_DIMENSIONS_OPT,
  SOURCE_TEXT,
  DEFPARAM_ASSIGN,
  DECL_DIMENSIONS,
  CONSTANT_DEC_NUMBER,
  CASE_STATEMENT,
  ASSIGNMENT_STATEMENT,
  DPI_IMPORT_PROPERTY_OPT,
  DPI_SPEC_STRING,
  TRAILING_DECL_ASSIGNMENT,
  ALWAYS_CONSTRUCT,
  GENVAR_OPT,
  ANY_PORT_LIST_NAMED,
  SUBROUTINE_CALL,
  PROPERTY_EXPR_OR_ASSIGNMENT,
  ANY_ARGUMENT,
  MODULE_OR_INTERFACE_DECLARATION,
  EXPRESSION_OPT,
  GATE_INSTANCE_OR_REGISTER_VARIABLE_LIST,
  TK_EVALSTRINGLITERAL,
  DELAY_OR_EVENT_CONTROL,
  UDP_INPUT_LIST,
  PARAMETER_VALUE_BYNAME_LIST,
  MODULE_PORT_LIST_OPT,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT,
  ANY_PORT_LIST_TRAILING_COMMA_POSITIONAL,
  BLOCK_ITEM_OR_STATEMENT_OR_NULL_LIST_OPT,
  GENVAR_DECLARATION,
  NUMBER,
  SPECIFY_ITEM_LIST,
  TK_LS_EQ,
  TF_VARIABLE_IDENTIFIER,
  INITIAL_CONSTRUCT,
  LOCALPARAM_ASSIGN_LIST,
  DISABLE_STATEMENT,
  LIST_OF_MODULE_ITEM_IDENTIFIERS,
  ANY_PORT_LIST_ITEM_LAST_NAMED,
  NET_VARIABLE,
  PARAMETER_EXPR_LIST,
  SPECPARAM_DECLARATION,
  DEFERRED_IMMEDIATE_ASSERTION_STATEMENT,
  SLICE_SIZE_OPT,
  CONCURRENT_ASSERTION_ITEM,
  CLOCKING_ITEM_LIST_OPT,
  CYCLE_DELAY,
  MACROIDITEM,
  ASSUME_PROPERTY_STATEMENT,
  PULL01,
  PREPROCESSOR_DIRECTIVE,
  MODULE_ITEM_DIRECTIVE,
  ASSERT_PROPERTY_STATEMENT,
  SCOPE_OR_IF_RES,
  TASK_PROTOTYPE,
  CLOCKING_DECLARATION,
  BLOCK_IDENTIFIER_OPT,
  MACROIDENTIFIER,
  PROPERTY_SPEC_DISABLE_IFF_OPT,
  MACROGENERICITEM,
  MODULE_BLOCK,
  STREAM_EXPRESSION,
  FINAL_OR_ZERO,
  TK_EDGE_DESCRIPTOR,
  METHOD_PROPERTY_QUALIFIER_LIST_NOT_STARTING_WITH_VIRTUAL,
  IDENTIFIER_OPT,
  MODULE_PARAMETER_PORT_LIST_PREPROCESSOR_LAST,
  TYPE_ASSIGNMENT,
  TYPE_ASSIGNMENT_LIST,
  METHOD_QUALIFIER_LIST_OPT,
  STREAM_OPERATOR,
  ASSERTION_ITEM,
  PROPERTY_SPEC,
  STREAMING_CONCATENATION,
  EDGE_DESCRIPTOR_LIST,
  PROPERTY_QUALIFIER,
  EVENT_CONTROL_OPT,
  CLASS_ITEM_QUALIFIER,
  CONCURRENT_ASSERTION_STATEMENT,
  COVER_PROPERTY_STATEMENT,
  STREAM_EXPRESSION_LIST,
  CLASS_ITEM_QUALIFIER_LIST_OPT,
  ASSERTION_ITEM_DECLARATION,
  BOOLEAN_ABBREV,
  CYCLE_DELAY_RANGE,
  PROPERTY_OPERATOR,
  PROPERTY_SPEC_DISABLE_IFF,
  CONFIG_DECLARATION,
  WITH_CONSTRAINT_BLOCK_OPT,
  RANDOM_QUALIFIER,
  BIND_TARGET_INSTANCE_LIST,
  CLOCKING_ITEM_LIST,
  MODPORT_DECLARATION,
  CLASS_CONSTRAINT,
  NET_ALIAS,
  TYPE_REFERENCE,
  METHOD_QUALIFIER_LIST,
  INTERFACE_TYPE,
  PACKAGE_EXPORT_DECLARATION,
  INTERFACE_OPT,
  DATA_TYPE_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID,
  COVERAGE_SPEC_OR_OPTION_LIST_OPT,
  MODPORT_ITEM_LIST,
  EXPECT_PROPERTY_STATEMENT,
  LIB_CELL_IDENTIFIERS_OPT,
  SEQUENCE_PORT_LIST_IN_PARENS_OPT,
  CLOCKING_DIRECTION,
  GOTO_REPETITION,
  CONSTRAINT_BLOCK_ITEM,
  ASSERTION_VARIABLE_DECLARATION,
  TK_STATIC_OPT,
  DESIGN_STATEMENT,
  SEQUENCE_DECLARATION,
  CLOCKING_ITEM,
  PROPERTY_PORT_ITEM,
  LIST_OF_CONFIG_RULE_STATEMENTS,
  CYCLE_RANGE,
  BIND_TARGET_INSTANCE,
  LIB_CELL_ID,
  PROPERTY_DECLARATION,
  PROPERTY_FORMAL_TYPE_FOLLOWED_BY_ID,
  MODPORT_SIMPLE_PORTS_DECLARATION_LAST,
  COVERGROUP_DECLARATION,
  COVERAGE_SPEC,
  CONSECUTIVE_REPETITION,
  LIST_OF_LIBRARIES_OPT,
  IDENTIFIER_LIST_IN_PARENS_OPT,
  LIST_OF_CLOCKING_DECL_ASSIGN,
  COVERAGE_EVENT,
  CONFIG_RULE_STATEMENT,
  TYPE_IDENTIFIER_OR_IMPLICIT_BASIC_FOLLOWED_BY_ID,
  ASSERTION_VARIABLE_DECLARATION_LIST,
  CONSTRAINT_EXPRESSION_NO_PREPROCESSOR,
  CLOCKING_DECL_ASSIGN,
  WITH_CONSTRAINT_BLOCK,
  OPTIONAL_SEMICOLON,
  PROPERTY_PORT_LIST_IN_PARENS_OPT,
  MODPORT_SIMPLE_PORTS_DECLARATION_BEGIN,
  MODPORT_SIMPLE_PORT,
  CLOCKING_SKEW_OPT,
  IMPLICATION_OPERATOR,
  NET_ALIAS_ASSIGN_LVALUE_LIST,
  NONCONSECUTIVE_REPETITION,
  BINS_OR_OPTIONS_LIST_OPT,
  SEQUENCE_PORT_LIST_OPT,
  PROPERTY_PORT_MODIFIERS_OPT,
  LIBLIST_CLAUSE,
  CONSTRAINT_DECLARATION,
  PROPERTY_ACTUAL_ARG_OPT,
  LIST_OF_CONFIG_RULE_STATEMENTS_OPT,
  MODPORT_PORTS_LIST,
  COVER_POINT,
  MODPORT_ITEM,
  CONSTRAINT_BLOCK_ITEM_LIST_OPT,
  LIB_CELL_IDENTIFIERS,
  METHOD_QUALIFIER,
  PROPERTY_PORT_LIST,
  LIST_OF_LIBRARIES,
  CONSTRAINT_BLOCK_ITEM_LIST,
  COVERAGE_SPEC_OR_OPTION_LIST,
  CONSTRAINT_BLOCK,
  HIERARCHY_OR_CALL_EXTENSION,
  COVERAGE_EVENT_OPT,
  CYCLE_RANGE_OR_EXPR,
  COVERAGE_SPEC_OR_OPTION,
  TK_STRONG,
  PREPROCESSOR_ELSE_CLASS_ITEM,
  TK_GENVAR,
  FILE_PATH_SPEC_LIST,
  PREPROCESSOR_ELSIF_DESCRIPTION_ITEM,
  BRANCH_PROBE_EXPRESSION,
  TK_RCMOS,
  TK_PIPEARROW2,
  TK_SSETUP,
  PREPROCESSOR_ELSIF_GENERATE_ITEMS,
  TK_SSKEW,
  TK_NEW,
  LIBRARY_SOURCE,
  TK_LOCALPARAM,
  PREPROCESSOR_ELSIF_PORT_DECLARATIONS_OPT,
  TK_UNION,
  TK_SHOWCANCELLED,
  TK_WAND,
  DR_BEGIN_KEYWORDS,
  MEMBER_PATTERN_LIST,
  TK_STRONG0,
  ANALOG_CONSTRUCT,
  TK_WREAL,
  TK_RAND,
  TK_POUNDPOUND,
  NATURE_ITEMS,
  DR_SUPPRESS_FAULTS,
  TK_REPEAT,
  TK_TIME,
  DR_RESETALL,
  TK_CLOCKING,
  TK_PARAMETER,
  TK_INITIAL,
  TK_PULSESTYLE_ONDETECT,
  DISCIPLINE_ITEMS,
  TK_GLOBAL,
  DR_END_KEYWORDS,
  TK_SAMPLE,
  TK_UNIQUE_INDEX,
  TK_CMOS,
  TK_PSTAR,
  TK_EXTERN,
  MODULE_ATTRIBUTE_FOREIGN,
  TK_CONSTRAINT,
  TK_SOLVE,
  TK_TRIAND,
  TK_JOIN_NONE,
  TK_STATIC,
  PP_DEFINE,
  DISCIPLINE_DECLARATION,
  TK_DISABLE,
  TK_REVERSE,
  TK_SHORTREAL,
  TK_FIND_LAST_INDEX,
  TK_EXPECT,
  ANALOG_STATEMENT,
  UDP_UNKNOWN_LIST,
  TK_LBSTARRB,
  PREPROCESSOR_ELSIF_MODULE_ITEMS,
  RS_CASE,
  PREPROCESSOR_BALANCED_CLASS_ITEMS,
  NAMED_PARAMETER_ASSIGNMENT_LIST,
  RS_CASE_ITEM_LIST,
  DR_PRAGMA,
  TK_DISCRETE,
  TK_FLOW,
  TK_REF,
  PREPROCESSOR_ELSIF_STATEMENTS,
  TK_XNOR,
  TK_SUPPLY1,
  TK_CONST,
  TK_LOCAL_SCOPE,
  TK_STRONG1,
  TK_RELEASE,
  DISCIPLINE_ITEMS_OPT,
  TK_PROGRAM,
  PREPROCESSOR_ELSIF_MODULE_ITEM,
  PREPROCESSOR_ELSE_STATEMENT_OPT,
  TK_ALWAYS,
  PREPROCESSOR_ELSIF_CLASS_ITEM,
  TK_TABLE,
  TK_TRIGGER,
  TK_LIBLIST,
  PREPROCESSOR_ELSIF_HEADER,
  TK_PURE,
  TK_CASE,
  TK_SHOLD,
  TK_LBRARROW,
  TK_PACKAGE,
  TK_ALWAYS_FF,
  TK_FILEPATH,
  TK_COLON_EQ,
  PREPROCESSOR_ELSIF_CONFIG_RULE_STATEMENTS_OPT,
  TK_PULLDOWN,
  TK_RPMOS,
  PREPROCESSOR_ELSE_GENERATE_ITEM_OPT,
  TK_BIT,
  TK_CHANDLE,
  PREPROCESSOR_ELSIF_BINS_OR_OPTIONS_LIST,
  TK_BINSOF,
  MACRO_ARGS_OPT,
  TK_SRECOVERY,
  TK_CONFIG,
  TK_NONBLOCKING_TRIGGER,
  TK_SHUFFLE,
  TK_SIGNED,
  TK_INCR,
  TK_ALWAYS_LATCH,
  PREPROCESSOR_BALANCED_GENERATE_ITEMS,
  TK_PRODUCT,
  PREPROCESSOR_ELSE_MODULE_ITEM_OPT,
  TK_INPUT,
  TK_ASSIGN,
  PREPROCESSOR_ELSIF_DESCRIPTION_ITEMS_OPT,
  DR_DELAY_MODE_DISTRIBUTED,
  PREPROCESSOR_ELSE_PACKAGE_ITEM,
  BINS_OR_OPTIONS_LIST_OPT_PP,
  PREPROCESSOR_ELSIF_PACKAGE_ITEMS_OPT,
  TK_S_UNTIL_WITH,
  RS_CASE_ITEM,
  ANY_PORT_LIST_PREPROCESSOR_LAST_POSITIONAL,
  TK_IGNORE_BINS,
  TK_SUM,
  TKK_ATTRIBUTE,
  TK_MAX,
  PREPROCESSOR_ELSE_CONSTRAINT_BLOCK_ITEM_OPT,
  TK_NEXTTIME,
  TK_SEQUENCE,
  TK_AUTOMATIC,
  PREPROCESSOR_ELSE_STATEMENT,
  TK_PULLUP,
  PREPROCESSOR_ELSIF_DESCRIPTION_ITEMS,
  ENUM_NAME_LIST_PREPROCESSOR_LAST,
  FROM_EXCLUDE,
  TK_INT,
  TK_JOIN,
  TK_FIND_FIRST_INDEX,
  TK_IMPLEMENTS,
  DISCIPLINE_ITEM,
  BLOCK_EVENT_EXPRESSION,
  TK_DISCIPLINE,
  INCLUDE_STATEMENT,
  TK_LBSTAR,
  PREPROCESSOR_ELSIF_BINS_OR_OPTIONS_LIST_OPT,
  TK_LBEQ,
  TK_VOID,
  TK_EXCLUDE,
  TK_RANDC,
  TK_WEAK,
  TK_INSTANCE,
  TK_TYPE_OPTION,
  TK_WAIT,
  TK_ABSTOL,
  TK_DECR,
  TK_XOR,
  TK_TIMEPRECISION,
  DR_DELAY_MODE_ZERO,
  TK_FIND_FIRST,
  TK_PULSESTYLE_ONEVENT,
  TK_COVERGROUP,
  PREPROCESSOR_ELSIF_CONSTRAINT_BLOCK_ITEMS_OPT,
  MACRO_DIGITS,
  TK_UNITS,
  TK_TRAN,
  TK_WILDCARD,
  PREPROCESSOR_BALANCED_BINS_OR_OPTIONS_LIST,
  TK_FINAL,
  PREPROCESSOR_ELSE_PACKAGE_ITEM_OPT,
  PREPROCESSOR_ELSIF_CLASS_ITEMS,
  ANY_ARGUMENT_LIST_PREPROCESSOR_LAST,
  TK_SORT,
  INCDIR_SPEC,
  PREPROCESSOR_IF_HEADER,
  DR_DISABLE_PORTFAULTS,
  TK_S_NEXTTIME,
  TK_WITH,
  DR_UNCONNECTED_DRIVE,
  TK_SNOCHANGE,
  MACRO_CALL_OR_ITEM,
  LIBRARY_DESCRIPTION_LIST_OPT,
  PREPROCESSOR_ELSIF_PORT_DECLARATION,
  TK_CONTEXT,
  TK_INCLUDE,
  TK_VAR,
  PREPROCESSOR_BALANCED_CONSTRAINT_BLOCK_ITEM,
  TK_MODULE,
  DR_USELIB,
  CONSTRAINT_DECLARATION_PACKAGE_ITEM,
  DR_NOUNCONNECTED_DRIVE,
  TK_EVENT,
  TK_ACCESS,
  TK_TYPEDEF,
  LIBRARY_DESCRIPTION,
  PREPROCESSOR_BALANCED_DESCRIPTION_ITEMS,
  PREPROCESSOR_ELSIF_PORT_DECLARATIONS,
  PREPROCESSOR_ELSE_BINS_OR_OPTIONS_OPT,
  PREPROCESSOR_ELSE_PORT_DECLARATIONS,
  TK_UNTIL_WITH,
  TK_ATAT,
  TK_OPTION,
  TK_NEGEDGE,
  TK_UNTIL,
  TK_PO_NEG,
  PREPROCESSOR_BALANCED_CONFIG_RULE_STATEMENTS,
  MEMBER_PATTERN,
  TK_WEAK1,
  TK_1STEP,
  PARAMETER_VALUE_BYNAME_LIST_PREPROCESSOR_LAST,
  TK_UNSIGNED,
  MACRO_ARG_OPT,
  TK_TAGGED,
  TK_SCOPE_RES,
  DR_ENDPROTECT,
  DR_DELAY_MODE_UNIT,
  PARAMETER_VALUE_RANGES,
  NATURE_ITEM,
  TK_VIRTUAL,
  TK_WITH__COVERGROUP,
  ERROR,
  TK_SPECPARAM,
  TK_ASSUME,
  TK_UWIRE,
  TK_RTRAN,
  PREPROCESSOR_ELSIF_CONSTRAINT_EXPRESSIONS_OPT,
  TK_SYNC_ACCEPT_ON,
  TK_COVERPOINT,
  TK_RNMOS,
  TK_EVENTUALLY,
  PREPROCESSOR_ELSE_DESCRIPTION_ITEM,
  TK_THIS,
  TK_DO,
  TK_MODPORT,
  TK_SOFT,
  DR_DEFAULT_TRIREG_STRENGTH,
  TK_TRIREG,
  DESCRIPTION_LIST_OPT,
  TK_EDGE,
  PREPROCESSOR_ELSIF_STATEMENTS_OPT,
  CASE_ITEM_EXPRESSION,
  TK_INFINITE,
  PREPROCESSOR_ELSE_CONFIG_RULE_STATEMENT,
  TK_NATURE,
  TK_ANALOG,
  TK_MACROMODULE,
  TK_S_EVENTUALLY,
  TK_SRECREM,
  TK_NULL,
  TK_LP,
  PREPROCESSOR_ELSE_CLASS_ITEM_OPT,
  NAMED_PARAMETER_ASSIGNMENT,
  TK_MIN,
  TK_UNIQUE0,
  TK_OR,
  TK_WONE,
  TK_RS,
  TK_FIND,
  PREPROCESSOR_ELSIF_CONFIG_RULE_STATEMENT,
  TK_END,
  TK_BIND,
  INCDIR_SPEC_OPT,
  PREPROCESSOR_ELSIF_CONSTRAINT_EXPRESSIONS,
  PREPROCESSOR_ELSE_CONSTRAINT_EXPRESSION,
  TK_CONTINUE,
  TK_CROSS,
  DR_TIMESCALE,
  PREPROCESSOR_ELSIF_CONSTRAINT_BLOCK_ITEM,
  TK_ALIAS,
  PREPROCESSOR_BALANCED_CONSTRAINT_EXPRESSIONS,
  TK_INTEGER,
  TK_JOIN_ANY,
  TK_INTERFACE,
  TF_PORT_LIST_PREPROCESSOR_LAST,
  TK_EXPORT,
  PREPROCESSOR_ELSIF_STATEMENT,
  PREPROCESSOR_ELSE_CONFIG_RULE_STATEMENT_OPT,
  TK_NXOR,
  PREPROCESSOR_ELSIF_GENERATE_ITEMS_OPT,
  TK_SUPPLY0,
  TK_S_ALWAYS,
  TK_REG,
  FILE_PATH_SPEC,
  DR_ENDCELLDEFINE,
  PREPROCESSOR_LIST_OF_PORTS_OR_PORT_DECLARATIONS_OPT,
  TK_IMPLIES,
  TK_FIRST_MATCH,
  PREPROCESSOR_ELSIF_PACKAGE_ITEMS,
  TK_PMOS,
  PREPROCESSOR_BALANCED_MODULE_ITEMS,
  BLOCK_EVENT_EXPR_PRIMARY,
  CONSTRAINT_PROTOTYPE,
  TK_LS,
  TK_CELL,
  TK_WEAK0,
  DR_ENABLE_PORTFAULTS,
  TK_NOSHOWCANCELLED,
  TK_NOT,
  PREPROCESSOR_ELSE_BINS_OR_OPTIONS,
  TK_COVER,
  PREPROCESSOR_CONTROL_FLOW,
  TK_OUTPUT,
  TK_TRI1,
  TK_DOTSTAR,
  TK_TIMEUNIT,
  TK_TRI,
  MACROCALL,
  TK_INOUT,
  TK_CASEX,
  TK_POTENTIAL,
  TK_POUNDEQPOUND,
  TK_LET,
  DR_DEFAULT_NETTYPE,
  TK_BEGIN,
  TK_CASEZ,
  TK_NETTYPE,
  TK_PULL0,
  TK_ILLEGAL_BINS,
  DECAY_VALUE_SIMPLE,
  TK_ENUM,
  TK_WOR,
  TK_INF,
  TK_SROOT,
  TK_INTERCONNECT,
  PREPROCESSOR_BALANCED_PACKAGE_ITEMS,
  TK_SHORTINT,
  TK_STRUCT,
  TK_BREAK,
  TK_NMOS,
  TK_STRING,
  TK_SYNC_REJECT_ON,
  TK_WIRE,
  TK_PO_POS,
  TK_RETURN,
  TK_PIPEARROW,
  PREPROCESSOR_ELSE_DESCRIPTION_ITEM_OPT,
  DR_PROTECT,
  MACROCALLITEM,
  TK_DOMAIN,
  TK_STIMESKEW,
  MACROARG,
  TK_TIMEPRECISION_CHECK,
  TK_BINS,
  TK_DEASSIGN,
  TK_NOR,
  TK_PACKED,
  PREPROCESSOR_ELSE_PORT_DECLARATIONS_OPT,
  TK_PRIMITIVE,
  TK_NAND,
  PREPROCESSOR_ELSE_CONSTRAINT_BLOCK_ITEM,
  TK_PRIORITY,
  NATURE_DECLARATION,
  PREPROCESSOR_ELSIF_CONFIG_RULE_STATEMENTS,
  DR_CELLDEFINE,
  TK_ACCEPT_ON,
  TK_SWIDTH,
  TK_BYTE,
  TK_LBPLUSRB,
  TK_RANDSEQUENCE,
  TK_DIST,
  PREPROCESSOR_ELSIF_GENERATE_ITEM,
  TK_CONTINUOUS,
  MACROCALLID,
  DR_NOSUPPRESS_FAULTS,
  TK_DEFPARAM,
  PREPROCESSOR_ELSIF_PACKAGE_ITEM,
  CASE_ITEM_EXPRESSION_LIST,
  CLASS_ITEM_QUALIFIER_LIST,
  TK_ASSERT,
  TK_DEFAULT,
  PP_UNDEF,
  PP_ENDIF,
  TK_PROTECTED,
  PREPROCESSOR_ELSIF_CONSTRAINT_EXPRESSION,
  VALUE_RANGE_EXPRESSION,
  DR_DEFAULT_DECAY_TIME,
  TK_LIBRARY,
  TK_LOCAL,
  TK_UNTYPED,
  TK_UNIQUE,
  TK_SSETUPHOLD,
  TK_USE,
  PREPROCESSOR_ELSE_MODULE_ITEM,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_PREPROCESSOR_LAST_NON_ANSI,
  TK_SFULLSKEW,
  TK_BUF,
  TK_PROPERTY,
  TK_PULL1,
  TK_SPERIOD,
  PREPROCESSOR_ELSE_CONSTRAINT_EXPRESSION_OPT,
  SELECT_DIMENSIONS,
  PREPROCESSOR_ELSIF_MODULE_ITEMS_OPT,
  TK_TIMEUNIT_CHECK,
  PARAMETER_VALUE_RANGE,
  TK_EXTENDS,
  TK_TRIOR,
  TK_S_UNTIL,
  LIBRARY_DECLARATION,
  TK_RSORT,
  TK_POSEDGE,
  TK_GENERATE,
  TK_DESIGN,
  TK_ALWAYS_COMB,
  LIBRARY_DESCRIPTION_LIST,
  PREPROCESSOR_ELSE_GENERATE_ITEM,
  TK_TRI0,
  PREPROCESSOR_BALANCED_STATEMENTS,
  TK_REAL,
  TK_FROM,
  DR_DELAY_MODE_PATH,
  TK_RANDOMIZE,
  TK_AND,
  TK_LOGIC,
  TK_DDT_NATURE,
  PREPROCESSOR_ELSIF_BINS_OR_OPTIONS,
  CONSTRAINT_EXPRESSION_LIST_OPT,
  DECLARATION_EXTENDS_LIST,
  PP_INCLUDE,
  TK_SUPER,
  PREPROCESSOR_ELSIF_CONSTRAINT_BLOCK_ITEMS,
  PREPROCESSOR_ELSIF_CLASS_ITEMS_OPT,
  TK_POUNDMINUSPOUND,
  TK_REJECT_ON,
  TK_FUNCTION,
  TK_SUNIT,
  TK_RESTRICT,
  TK_TASK,
  TK_FIND_LAST,
  TK_SREMOVAL,
  TK_LONGINT,
  TK_TYPE,
  PD_LIBRARY_SYNTAX_BEGIN,
  TK_FIND_INDEX,
  TK_IDT_NATURE,
  TK_IMPORT,
  TK_COLON_DIV,
  BLOCK_EVENT_OR_EXPR,
  UNTIL_OPERATOR,
  COVER_SEQUENCE_STATEMENT,
  WITH_COVERGROUP_EXPRESSION_IN_PARENS,
  DECLARATION_EXTENDS_LIST_OPT,
  RS_IF_ELSE,
  FOLLOWED_BY_OPERATOR,
  LOCAL_SEQUENCE_LVAR_PORT_DIRECTION_OPT,
  BINS_EXPRESSION,
  PROPERTY_ACTUAL_ARG,
  SELECT_EXPRESSION,
  SLICE_SIZE,
  PROPERTY_CASE_ITEM,
  DEFAULT_SKEW,
  CONSTRAINT_EXPRESSION_LIST,
  MODPORT_CLOCKING_DECLARATION_BEGIN,
  PROPERTY_CASE_ITEM_LIST,
  RANDOMIZE_CALL,
  CROSS_ITEM_LIST,
  PRODUCTION_ITEM,
  DATA_TYPE_OR_VOID_WITH_ID,
  LB_STAR_RB,
  MODPORT_CLOCKING_DECLARATION_LAST,
  UNIQUENESS_CONSTRAINT,
  ANY_PORT_LIST_PREPROCESSOR_LAST_NAMED,
  MODPORT_TF_PORTS_DECLARATION_TRAILING_COMMA,
  INTERFACE_DATA_DECLARATION,
  METHOD_PROPERTY_QUALIFIER,
  BINS_OR_OPTIONS_LIST,
  OPT_CONFIG,
  PATTERN_LIST,
  BINS_OR_OPTIONS,
  PATTERN_OPT,
  INTERFACE_CLASS_ITEM_LIST,
  CROSS_BODY_ITEM_LIST,
  MODPORT_TF_PORTS_DECLARATION_BEGIN,
  RS_RULE_LIST,
  CELL_CLAUSE,
  SEQUENCE_PORT_LIST,
  LET_PORT_LIST,
  PRODUCTION_LIST,
  RS_PRODUCTION_LIST_OR_RAND_JOIN,
  RS_CODE_BLOCK,
  LET_DECLARATION,
  EXPRESSION_IN_PARENS_OPT,
  ARRAY_METHOD_WITH_PREDICATE_OPT,
  CROSS_ITEM,
  MODPORT_TF_PORTS_DECLARATION_LAST,
  CASE_PATTERN_ITEM,
  INST_CLAUSE,
  RS_REPEAT,
  COVERGROUP_EXPRESSION_BRACKETED_OPT,
  CLOCKING_DRIVE_ONLY,
  CONSTRAINT_PRIMARY,
  CONSTRAINT_EXPRESSION,
  SEQUENCE_MATCH_ITEM_LIST,
  SEQUENCE_SPEC,
  COVER_CROSS,
  WILDCARD_OPT,
  CASE_INSIDE_ITEMS,
  MODPORT_TF_PORT,
  WEIGHT_SPECIFICATION,
  SELECT_CONDITION,
  DEFERRED_IMMEDIATE_ASSERTION_ITEM,
  LET_FORMAL_TYPE_FOLLOWED_BY_ID,
  COVERAGE_BIN_RHS,
  PRODUCTION_ITEMS_LIST,
  PREPROCESSOR_BALANCED_PORT_DECLARATIONS,
  SIMPLE_TYPE,
  RS_PRODUCTION_LIST,
  DPI_EXPORT_ITEM,
  PRODUCTION,
  MODPORT_CLOCKING_DECLARATION_TRAILING_COMMA,
  LET_PORT_LIST_IN_PARENS_OPT,
  CROSS_BODY,
  USE_CLAUSE,
  SEQUENCE_MATCH_ITEM,
  COVERAGE_BIN,
  SEQUENCE_PORT_TYPE_FOLLOWED_BY_ID,
  INTERFACE_CLASS_DECLARATION,
  IDENTIFIER_LIST,
  SEQUENCE_PORT_ITEM,
  DIST_ITEM,
  DIST_WEIGHT,
  BINS_KEYWORD,
  LIST_OF_PORTS_OR_PORT_DECLARATIONS_PREPROCESSOR_LAST_ANSI,
  IMPLEMENTS_INTERFACE_LIST,
  LET_PORT_ITEM,
  ARRAY_METHOD_WITH_PREDICATE,
  COVERAGE_OPTION,
  CONSTRAINT_SET,
  PATTERN,
  NET_TYPE_DECLARATION,
  BINS_SELECTION,
  EXPRESSION_OR_DIST_LIST,
  CLOCKING_SKEW,
  INTERFACE_CLASS_ITEM,
  SEQUENCE_EXPR_MATCH_ITEM_LIST,
  TK_ANGLEBRACKETINCLUDE,
  INTERFACE_CLASS_ITEM_LIST_OPT,
  IMPORT_EXPORT,
  WITH_COVERGROUP_EXPRESSION,
  CONSTRAINT_PRIMARY_LIST,
  PROPERTY_CASE_STATEMENT,
  CHARGE_STRENGTH,
  DPI_IMPORT_PROPERTY,
  IFF_EXPR_OPT,
  RS_RULE,
  INTERFACE_CLASS_METHOD,
  MODPORT_SIMPLE_PORTS_DECLARATION_TRAILING_COMMA,
  CASE_INSIDE_ITEM,
  RESTRICT_PROPERTY_STATEMENT,
  DIST_LIST,
  RS_PROD,
  ARRAY_ORDERING_METHOD,
  RANDSEQUENCE_STATEMENT,
  CROSS_BODY_ITEM,
  CASE_PATTERN_ITEMS,
  CROSS_BODY_ITEM_LIST_OPT,
  MODPORT_PORTS_DECLARATION_TRAILING_COMMA,
  SET_COVERGROUP_EXPRESSION_OR_COVERGROUP_RANGE_LIST_OR_TRANS_LIST,
};

/**
 * @class Node
 * @brief Represents a node in the abstract syntax tree (AST).
 *
 * This class defines the basic properties and operations for a node in a tree.
 * It includes methods to manage its children, parent, and element data.
 */
class Node {
public:
  NodeType type = NodeType::BASE_NODE;

  virtual ~Node() = default;
  Node() = default;
  Node(Node &&) = default;
  Node &operator=(Node &&) = default;

  const std::vector<std::unique_ptr<Node>> &getChildren();
  void insertChildToBegin(std::unique_ptr<Node>);
  void insertChildToEnd(std::unique_ptr<Node>);
  void insertChild(std::unique_ptr<Node>,
                   std::vector<std::unique_ptr<Node>>::const_iterator);

  // Deletes the children of the node
  void clearChildren();

  void setChildren(std::vector<std::unique_ptr<Node>> &&children);

  Node *getParent();

  void setParent(Node *parent);

  std::string getElement();

  void setElement(std::string element);

  std::unique_ptr<Node> extractChild(Node *);

private:
  std::vector<std::unique_ptr<Node>> children;

  Node *parent;

  std::string element;
};

/**
 * @class Terminal
 * @brief Represents a terminal node in abstract syntax tree.
 *
 * This class extends the `Node` class to represent a terminal node, which has
 * no children.
 *
 * @see Node
 */
class Terminal : public Node {
public:
  Terminal(std::string element);
};

class Sequence_delay_range_expr : public Node {
public:
  Sequence_delay_range_expr(std::string element);
  Sequence_delay_range_expr(Sequence_delay_range_expr &&) = default;
  Sequence_delay_range_expr &operator=(Sequence_delay_range_expr &&) = default;
};

class Port : public Node {
public:
  Port(std::string element);
  Port(Port &&) = default;
  Port &operator=(Port &&) = default;
};

class Specify_simple_path : public Node {
public:
  Specify_simple_path(std::string element);
  Specify_simple_path(Specify_simple_path &&) = default;
  Specify_simple_path &operator=(Specify_simple_path &&) = default;
};

class Event_control : public Node {
public:
  Event_control(std::string element);
  Event_control(Event_control &&) = default;
  Event_control &operator=(Event_control &&) = default;
};

class String_literal : public Node {
public:
  String_literal(std::string element);
  String_literal(String_literal &&) = default;
  String_literal &operator=(String_literal &&) = default;
};

class Charge_strength_opt : public Node {
public:
  Charge_strength_opt(std::string element);
  Charge_strength_opt(Charge_strength_opt &&) = default;
  Charge_strength_opt &operator=(Charge_strength_opt &&) = default;
};

class Dpi_import_export : public Node {
public:
  Dpi_import_export(std::string element);
  Dpi_import_export(Dpi_import_export &&) = default;
  Dpi_import_export &operator=(Dpi_import_export &&) = default;
};

class For_initialization_opt : public Node {
public:
  For_initialization_opt(std::string element);
  For_initialization_opt(For_initialization_opt &&) = default;
  For_initialization_opt &operator=(For_initialization_opt &&) = default;
};

class List_of_port_identifiers : public Node {
public:
  List_of_port_identifiers(std::string element);
  List_of_port_identifiers(List_of_port_identifiers &&) = default;
  List_of_port_identifiers &operator=(List_of_port_identifiers &&) = default;
};

class Non_integer_type : public Node {
public:
  Non_integer_type(std::string element);
  Non_integer_type(Non_integer_type &&) = default;
  Non_integer_type &operator=(Non_integer_type &&) = default;
};

class Parameter_value_ranges_opt : public Node {
public:
  Parameter_value_ranges_opt(std::string element);
  Parameter_value_ranges_opt(Parameter_value_ranges_opt &&) = default;
  Parameter_value_ranges_opt &
  operator=(Parameter_value_ranges_opt &&) = default;
};

class Package_item_no_pp : public Node {
public:
  Package_item_no_pp(std::string element);
  Package_item_no_pp(Package_item_no_pp &&) = default;
  Package_item_no_pp &operator=(Package_item_no_pp &&) = default;
};

class Sequence_delay_repetition_list : public Node {
public:
  Sequence_delay_repetition_list(std::string element);
  Sequence_delay_repetition_list(Sequence_delay_repetition_list &&) = default;
  Sequence_delay_repetition_list &
  operator=(Sequence_delay_repetition_list &&) = default;
};

class Add_expr : public Node {
public:
  Add_expr(std::string element);
  Add_expr(Add_expr &&) = default;
  Add_expr &operator=(Add_expr &&) = default;
};

class Dpi_import_item : public Node {
public:
  Dpi_import_item(std::string element);
  Dpi_import_item(Dpi_import_item &&) = default;
  Dpi_import_item &operator=(Dpi_import_item &&) = default;
};

class Tk_realtime : public Node {
public:
  Tk_realtime(std::string element);
  Tk_realtime(Tk_realtime &&) = default;
  Tk_realtime &operator=(Tk_realtime &&) = default;
};

class Case_item : public Node {
public:
  Case_item(std::string element);
  Case_item(Case_item &&) = default;
  Case_item &operator=(Case_item &&) = default;
};

class Property_if_else_expr : public Node {
public:
  Property_if_else_expr(std::string element);
  Property_if_else_expr(Property_if_else_expr &&) = default;
  Property_if_else_expr &operator=(Property_if_else_expr &&) = default;
};

class Non_anonymous_instantiation_base : public Node {
public:
  Non_anonymous_instantiation_base(std::string element);
  Non_anonymous_instantiation_base(Non_anonymous_instantiation_base &&) =
      default;
  Non_anonymous_instantiation_base &
  operator=(Non_anonymous_instantiation_base &&) = default;
};

class Unary_expr : public Node {
public:
  Unary_expr(std::string element);
  Unary_expr(Unary_expr &&) = default;
  Unary_expr &operator=(Unary_expr &&) = default;
};

class Unary_op : public Node {
public:
  Unary_op(std::string element);
  Unary_op(Unary_op &&) = default;
  Unary_op &operator=(Unary_op &&) = default;
};

class Class_id : public Node {
public:
  Class_id(std::string element);
  Class_id(Class_id &&) = default;
  Class_id &operator=(Class_id &&) = default;
};

class Reference : public Node {
public:
  Reference(std::string element);
  Reference(Reference &&) = default;
  Reference &operator=(Reference &&) = default;
};

class Cast : public Node {
public:
  Cast(std::string element);
  Cast(Cast &&) = default;
  Cast &operator=(Cast &&) = default;
};

class Tf_variable_identifier_first : public Node {
public:
  Tf_variable_identifier_first(std::string element);
  Tf_variable_identifier_first(Tf_variable_identifier_first &&) = default;
  Tf_variable_identifier_first &
  operator=(Tf_variable_identifier_first &&) = default;
};

class Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
    : public Node {
public:
  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
      std::string element);
  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt(
      Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt &&) =
      default;
  Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt &
  operator=(Type_identifier_or_implicit_basic_followed_by_id_and_dimensions_opt
                &&) = default;
};

class Type_or_id_root : public Node {
public:
  Type_or_id_root(std::string element);
  Type_or_id_root(Type_or_id_root &&) = default;
  Type_or_id_root &operator=(Type_or_id_root &&) = default;
};

class Module_or_generate_item : public Node {
public:
  Module_or_generate_item(std::string element);
  Module_or_generate_item(Module_or_generate_item &&) = default;
  Module_or_generate_item &operator=(Module_or_generate_item &&) = default;
};

class Module_parameter_port_list_trailing_comma : public Node {
public:
  Module_parameter_port_list_trailing_comma(std::string element);
  Module_parameter_port_list_trailing_comma(
      Module_parameter_port_list_trailing_comma &&) = default;
  Module_parameter_port_list_trailing_comma &
  operator=(Module_parameter_port_list_trailing_comma &&) = default;
};

class Instantiation_type : public Node {
public:
  Instantiation_type(std::string element);
  Instantiation_type(Instantiation_type &&) = default;
  Instantiation_type &operator=(Instantiation_type &&) = default;
};

class Parameters : public Node {
public:
  Parameters(std::string element);
  Parameters(Parameters &&) = default;
  Parameters &operator=(Parameters &&) = default;
};

class Reference_or_call_base : public Node {
public:
  Reference_or_call_base(std::string element);
  Reference_or_call_base(Reference_or_call_base &&) = default;
  Reference_or_call_base &operator=(Reference_or_call_base &&) = default;
};

class Param_type_followed_by_id_and_dimensions_opt : public Node {
public:
  Param_type_followed_by_id_and_dimensions_opt(std::string element);
  Param_type_followed_by_id_and_dimensions_opt(
      Param_type_followed_by_id_and_dimensions_opt &&) = default;
  Param_type_followed_by_id_and_dimensions_opt &
  operator=(Param_type_followed_by_id_and_dimensions_opt &&) = default;
};

class Structure_or_array_pattern_key : public Node {
public:
  Structure_or_array_pattern_key(std::string element);
  Structure_or_array_pattern_key(Structure_or_array_pattern_key &&) = default;
  Structure_or_array_pattern_key &
  operator=(Structure_or_array_pattern_key &&) = default;
};

class Parameter_assign_list : public Node {
public:
  Parameter_assign_list(std::string element);
  Parameter_assign_list(Parameter_assign_list &&) = default;
  Parameter_assign_list &operator=(Parameter_assign_list &&) = default;
};

class Defparam_assign_list : public Node {
public:
  Defparam_assign_list(std::string element);
  Defparam_assign_list(Defparam_assign_list &&) = default;
  Defparam_assign_list &operator=(Defparam_assign_list &&) = default;
};

class Generate_item_list_opt : public Node {
public:
  Generate_item_list_opt(std::string element);
  Generate_item_list_opt(Generate_item_list_opt &&) = default;
  Generate_item_list_opt &operator=(Generate_item_list_opt &&) = default;
};

class Tk_octdigits : public Node {
public:
  Tk_octdigits(std::string element);
  Tk_octdigits(Tk_octdigits &&) = default;
  Tk_octdigits &operator=(Tk_octdigits &&) = default;
};

class Sequence_expr_primary : public Node {
public:
  Sequence_expr_primary(std::string element);
  Sequence_expr_primary(Sequence_expr_primary &&) = default;
  Sequence_expr_primary &operator=(Sequence_expr_primary &&) = default;
};

class Lpvalue : public Node {
public:
  Lpvalue(std::string element);
  Lpvalue(Lpvalue &&) = default;
  Lpvalue &operator=(Lpvalue &&) = default;
};

class Label_opt : public Node {
public:
  Label_opt(std::string element);
  Label_opt(Label_opt &&) = default;
  Label_opt &operator=(Label_opt &&) = default;
};

class Escapedidentifier : public Node {
public:
  Escapedidentifier(std::string element);
  Escapedidentifier(Escapedidentifier &&) = default;
  Escapedidentifier &operator=(Escapedidentifier &&) = default;
};

class Generate_item : public Node {
public:
  Generate_item(std::string element);
  Generate_item(Generate_item &&) = default;
  Generate_item &operator=(Generate_item &&) = default;
};

class Data_type_primitive : public Node {
public:
  Data_type_primitive(std::string element);
  Data_type_primitive(Data_type_primitive &&) = default;
  Data_type_primitive &operator=(Data_type_primitive &&) = default;
};

class Spec_reference_event : public Node {
public:
  Spec_reference_event(std::string element);
  Spec_reference_event(Spec_reference_event &&) = default;
  Spec_reference_event &operator=(Spec_reference_event &&) = default;
};

class Udp_input_declaration_list : public Node {
public:
  Udp_input_declaration_list(std::string element);
  Udp_input_declaration_list(Udp_input_declaration_list &&) = default;
  Udp_input_declaration_list &
  operator=(Udp_input_declaration_list &&) = default;
};

class Non_port_module_item : public Node {
public:
  Non_port_module_item(std::string element);
  Non_port_module_item(Non_port_module_item &&) = default;
  Non_port_module_item &operator=(Non_port_module_item &&) = default;
};

class List_of_ports_or_port_declarations_trailing_comma_non_ansi : public Node {
public:
  List_of_ports_or_port_declarations_trailing_comma_non_ansi(
      std::string element);
  List_of_ports_or_port_declarations_trailing_comma_non_ansi(
      List_of_ports_or_port_declarations_trailing_comma_non_ansi &&) = default;
  List_of_ports_or_port_declarations_trailing_comma_non_ansi &operator=(
      List_of_ports_or_port_declarations_trailing_comma_non_ansi &&) = default;
};

class Module_parameter_port_list_opt : public Node {
public:
  Module_parameter_port_list_opt(std::string element);
  Module_parameter_port_list_opt(Module_parameter_port_list_opt &&) = default;
  Module_parameter_port_list_opt &
  operator=(Module_parameter_port_list_opt &&) = default;
};

class Property_prefix_expr : public Node {
public:
  Property_prefix_expr(std::string element);
  Property_prefix_expr(Property_prefix_expr &&) = default;
  Property_prefix_expr &operator=(Property_prefix_expr &&) = default;
};

class Expr_primary_braces : public Node {
public:
  Expr_primary_braces(std::string element);
  Expr_primary_braces(Expr_primary_braces &&) = default;
  Expr_primary_braces &operator=(Expr_primary_braces &&) = default;
};

class Pow_expr : public Node {
public:
  Pow_expr(std::string element);
  Pow_expr(Pow_expr &&) = default;
  Pow_expr &operator=(Pow_expr &&) = default;
};

class For_init_decl_or_assign : public Node {
public:
  For_init_decl_or_assign(std::string element);
  For_init_decl_or_assign(For_init_decl_or_assign &&) = default;
  For_init_decl_or_assign &operator=(For_init_decl_or_assign &&) = default;
};

class Udp_initial : public Node {
public:
  Udp_initial(std::string element);
  Udp_initial(Udp_initial &&) = default;
  Udp_initial &operator=(Udp_initial &&) = default;
};

class Tf_port_list_paren_opt : public Node {
public:
  Tf_port_list_paren_opt(std::string element);
  Tf_port_list_paren_opt(Tf_port_list_paren_opt &&) = default;
  Tf_port_list_paren_opt &operator=(Tf_port_list_paren_opt &&) = default;
};

class Struct_data_type : public Node {
public:
  Struct_data_type(std::string element);
  Struct_data_type(Struct_data_type &&) = default;
  Struct_data_type &operator=(Struct_data_type &&) = default;
};

class Udp_sequ_entry : public Node {
public:
  Udp_sequ_entry(std::string element);
  Udp_sequ_entry(Udp_sequ_entry &&) = default;
  Udp_sequ_entry &operator=(Udp_sequ_entry &&) = default;
};

class Net_variable_or_decl_assign : public Node {
public:
  Net_variable_or_decl_assign(std::string element);
  Net_variable_or_decl_assign(Net_variable_or_decl_assign &&) = default;
  Net_variable_or_decl_assign &
  operator=(Net_variable_or_decl_assign &&) = default;
};

class Parameter_value_byname_list_trailing_comma : public Node {
public:
  Parameter_value_byname_list_trailing_comma(std::string element);
  Parameter_value_byname_list_trailing_comma(
      Parameter_value_byname_list_trailing_comma &&) = default;
  Parameter_value_byname_list_trailing_comma &
  operator=(Parameter_value_byname_list_trailing_comma &&) = default;
};

class Inc_or_dec_expression : public Node {
public:
  Inc_or_dec_expression(std::string element);
  Inc_or_dec_expression(Inc_or_dec_expression &&) = default;
  Inc_or_dec_expression &operator=(Inc_or_dec_expression &&) = default;
};

class Net_type : public Node {
public:
  Net_type(std::string element);
  Net_type(Net_type &&) = default;
  Net_type &operator=(Net_type &&) = default;
};

class Select_dimensions_opt : public Node {
public:
  Select_dimensions_opt(std::string element);
  Select_dimensions_opt(Select_dimensions_opt &&) = default;
  Select_dimensions_opt &operator=(Select_dimensions_opt &&) = default;
};

class Spec_polarity : public Node {
public:
  Spec_polarity(std::string element);
  Spec_polarity(Spec_polarity &&) = default;
  Spec_polarity &operator=(Spec_polarity &&) = default;
};

class Macro_formal_parameter : public Node {
public:
  Macro_formal_parameter(std::string element);
  Macro_formal_parameter(Macro_formal_parameter &&) = default;
  Macro_formal_parameter &operator=(Macro_formal_parameter &&) = default;
};

class Structure_or_array_pattern_expression : public Node {
public:
  Structure_or_array_pattern_expression(std::string element);
  Structure_or_array_pattern_expression(
      Structure_or_array_pattern_expression &&) = default;
  Structure_or_array_pattern_expression &
  operator=(Structure_or_array_pattern_expression &&) = default;
};

class For_step : public Node {
public:
  For_step(std::string element);
  For_step(For_step &&) = default;
  For_step &operator=(For_step &&) = default;
};

class Specparam_list : public Node {
public:
  Specparam_list(std::string element);
  Specparam_list(Specparam_list &&) = default;
  Specparam_list &operator=(Specparam_list &&) = default;
};

class Tk_binbase : public Node {
public:
  Tk_binbase(std::string element);
  Tk_binbase(Tk_binbase &&) = default;
  Tk_binbase &operator=(Tk_binbase &&) = default;
};

class Tk_stringliteral : public Node {
public:
  Tk_stringliteral(std::string element);
  Tk_stringliteral(Tk_stringliteral &&) = default;
  Tk_stringliteral &operator=(Tk_stringliteral &&) = default;
};

class Var_opt : public Node {
public:
  Var_opt(std::string element);
  Var_opt(Var_opt &&) = default;
  Var_opt &operator=(Var_opt &&) = default;
};

class Identifier_optional_unpacked_dimensions : public Node {
public:
  Identifier_optional_unpacked_dimensions(std::string element);
  Identifier_optional_unpacked_dimensions(
      Identifier_optional_unpacked_dimensions &&) = default;
  Identifier_optional_unpacked_dimensions &
  operator=(Identifier_optional_unpacked_dimensions &&) = default;
};

class Function_item_list : public Node {
public:
  Function_item_list(std::string element);
  Function_item_list(Function_item_list &&) = default;
  Function_item_list &operator=(Function_item_list &&) = default;
};

class Type_declaration : public Node {
public:
  Type_declaration(std::string element);
  Type_declaration(Type_declaration &&) = default;
  Type_declaration &operator=(Type_declaration &&) = default;
};

class Udp_body : public Node {
public:
  Udp_body(std::string element);
  Udp_body(Udp_body &&) = default;
  Udp_body &operator=(Udp_body &&) = default;
};

class Mul_expr : public Node {
public:
  Mul_expr(std::string element);
  Mul_expr(Mul_expr &&) = default;
  Mul_expr &operator=(Mul_expr &&) = default;
};

class Par_block : public Node {
public:
  Par_block(std::string element);
  Par_block(Par_block &&) = default;
  Par_block &operator=(Par_block &&) = default;
};

class Keywordidentifier : public Node {
public:
  Keywordidentifier(std::string element);
  Keywordidentifier(Keywordidentifier &&) = default;
  Keywordidentifier &operator=(Keywordidentifier &&) = default;
};

class Logeq_expr : public Node {
public:
  Logeq_expr(std::string element);
  Logeq_expr(Logeq_expr &&) = default;
  Logeq_expr &operator=(Logeq_expr &&) = default;
};

class Module_common_item : public Node {
public:
  Module_common_item(std::string element);
  Module_common_item(Module_common_item &&) = default;
  Module_common_item &operator=(Module_common_item &&) = default;
};

class Primitive_gate_instance : public Node {
public:
  Primitive_gate_instance(std::string element);
  Primitive_gate_instance(Primitive_gate_instance &&) = default;
  Primitive_gate_instance &operator=(Primitive_gate_instance &&) = default;
};

class Data_type_or_implicit : public Node {
public:
  Data_type_or_implicit(std::string element);
  Data_type_or_implicit(Data_type_or_implicit &&) = default;
  Data_type_or_implicit &operator=(Data_type_or_implicit &&) = default;
};

class Tk_octbase : public Node {
public:
  Tk_octbase(std::string element);
  Tk_octbase(Tk_octbase &&) = default;
  Tk_octbase &operator=(Tk_octbase &&) = default;
};

class Sequence_expr : public Node {
public:
  Sequence_expr(std::string element);
  Sequence_expr(Sequence_expr &&) = default;
  Sequence_expr &operator=(Sequence_expr &&) = default;
};

class Tk_hexbase : public Node {
public:
  Tk_hexbase(std::string element);
  Tk_hexbase(Tk_hexbase &&) = default;
  Tk_hexbase &operator=(Tk_hexbase &&) = default;
};

class Property_expr : public Node {
public:
  Property_expr(std::string element);
  Property_expr(Property_expr &&) = default;
  Property_expr &operator=(Property_expr &&) = default;
};

class Seq_block : public Node {
public:
  Seq_block(std::string element);
  Seq_block(Seq_block &&) = default;
  Seq_block &operator=(Seq_block &&) = default;
};

class Task_item : public Node {
public:
  Task_item(std::string element);
  Task_item(Task_item &&) = default;
  Task_item &operator=(Task_item &&) = default;
};

class Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt
    : public Node {
public:
  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
      std::string element);
  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt(
      Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt &&) =
      default;
  Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt &
  operator=(Data_type_or_implicit_basic_followed_by_id_and_dimensions_opt &&) =
      default;
};

class Specify_block : public Node {
public:
  Specify_block(std::string element);
  Specify_block(Specify_block &&) = default;
  Specify_block &operator=(Specify_block &&) = default;
};

class Tk_decnumber : public Node {
public:
  Tk_decnumber(std::string element);
  Tk_decnumber(Tk_decnumber &&) = default;
  Tk_decnumber &operator=(Tk_decnumber &&) = default;
};

class Tk_decbase : public Node {
public:
  Tk_decbase(std::string element);
  Tk_decbase(Tk_decbase &&) = default;
  Tk_decbase &operator=(Tk_decbase &&) = default;
};

class Property_implication_expr : public Node {
public:
  Property_implication_expr(std::string element);
  Property_implication_expr(Property_implication_expr &&) = default;
  Property_implication_expr &operator=(Property_implication_expr &&) = default;
};

class Bit_logic_opt : public Node {
public:
  Bit_logic_opt(std::string element);
  Bit_logic_opt(Bit_logic_opt &&) = default;
  Bit_logic_opt &operator=(Bit_logic_opt &&) = default;
};

class Integer_atom_type : public Node {
public:
  Integer_atom_type(std::string element);
  Integer_atom_type(Integer_atom_type &&) = default;
  Integer_atom_type &operator=(Integer_atom_type &&) = default;
};

class Lifetime : public Node {
public:
  Lifetime(std::string element);
  Lifetime(Lifetime &&) = default;
  Lifetime &operator=(Lifetime &&) = default;
};

class Any_argument_list : public Node {
public:
  Any_argument_list(std::string element);
  Any_argument_list(Any_argument_list &&) = default;
  Any_argument_list &operator=(Any_argument_list &&) = default;
};

class Delay_value_list : public Node {
public:
  Delay_value_list(std::string element);
  Delay_value_list(Delay_value_list &&) = default;
  Delay_value_list &operator=(Delay_value_list &&) = default;
};

class Module_port_declaration : public Node {
public:
  Module_port_declaration(std::string element);
  Module_port_declaration(Module_port_declaration &&) = default;
  Module_port_declaration &operator=(Module_port_declaration &&) = default;
};

class Jump_statement : public Node {
public:
  Jump_statement(std::string element);
  Jump_statement(Jump_statement &&) = default;
  Jump_statement &operator=(Jump_statement &&) = default;
};

class Delay_value : public Node {
public:
  Delay_value(std::string element);
  Delay_value(Delay_value &&) = default;
  Delay_value &operator=(Delay_value &&) = default;
};

class Sequence_or_expr : public Node {
public:
  Sequence_or_expr(std::string element);
  Sequence_or_expr(Sequence_or_expr &&) = default;
  Sequence_or_expr &operator=(Sequence_or_expr &&) = default;
};

class Module_attribute_foreign_opt : public Node {
public:
  Module_attribute_foreign_opt(std::string element);
  Module_attribute_foreign_opt(Module_attribute_foreign_opt &&) = default;
  Module_attribute_foreign_opt &
  operator=(Module_attribute_foreign_opt &&) = default;
};

class Tf_port_direction_opt : public Node {
public:
  Tf_port_direction_opt(std::string element);
  Tf_port_direction_opt(Tf_port_direction_opt &&) = default;
  Tf_port_direction_opt &operator=(Tf_port_direction_opt &&) = default;
};

class Tf_port_item_expr_opt : public Node {
public:
  Tf_port_item_expr_opt(std::string element);
  Tf_port_item_expr_opt(Tf_port_item_expr_opt &&) = default;
  Tf_port_item_expr_opt &operator=(Tf_port_item_expr_opt &&) = default;
};

class Cont_assign_list : public Node {
public:
  Cont_assign_list(std::string element);
  Cont_assign_list(Cont_assign_list &&) = default;
  Cont_assign_list &operator=(Cont_assign_list &&) = default;
};

class Any_argument_list_trailing_comma : public Node {
public:
  Any_argument_list_trailing_comma(std::string element);
  Any_argument_list_trailing_comma(Any_argument_list_trailing_comma &&) =
      default;
  Any_argument_list_trailing_comma &
  operator=(Any_argument_list_trailing_comma &&) = default;
};

class Procedural_continuous_assignment : public Node {
public:
  Procedural_continuous_assignment(std::string element);
  Procedural_continuous_assignment(Procedural_continuous_assignment &&) =
      default;
  Procedural_continuous_assignment &
  operator=(Procedural_continuous_assignment &&) = default;
};

class Expression_or_dist : public Node {
public:
  Expression_or_dist(std::string element);
  Expression_or_dist(Expression_or_dist &&) = default;
  Expression_or_dist &operator=(Expression_or_dist &&) = default;
};

class Module_start : public Node {
public:
  Module_start(std::string element);
  Module_start(Module_start &&) = default;
  Module_start &operator=(Module_start &&) = default;
};

class Expr_primary_parens : public Node {
public:
  Expr_primary_parens(std::string element);
  Expr_primary_parens(Expr_primary_parens &&) = default;
  Expr_primary_parens &operator=(Expr_primary_parens &&) = default;
};

class Open_range_list : public Node {
public:
  Open_range_list(std::string element);
  Open_range_list(Open_range_list &&) = default;
  Open_range_list &operator=(Open_range_list &&) = default;
};

class Unary_prefix_expr : public Node {
public:
  Unary_prefix_expr(std::string element);
  Unary_prefix_expr(Unary_prefix_expr &&) = default;
  Unary_prefix_expr &operator=(Unary_prefix_expr &&) = default;
};

class Delay_identifier : public Node {
public:
  Delay_identifier(std::string element);
  Delay_identifier(Delay_identifier &&) = default;
  Delay_identifier &operator=(Delay_identifier &&) = default;
};

class List_of_identifiers_unpacked_dimensions : public Node {
public:
  List_of_identifiers_unpacked_dimensions(std::string element);
  List_of_identifiers_unpacked_dimensions(
      List_of_identifiers_unpacked_dimensions &&) = default;
  List_of_identifiers_unpacked_dimensions &
  operator=(List_of_identifiers_unpacked_dimensions &&) = default;
};

class Delay_scope : public Node {
public:
  Delay_scope(std::string element);
  Delay_scope(Delay_scope &&) = default;
  Delay_scope &operator=(Delay_scope &&) = default;
};

class Action_block : public Node {
public:
  Action_block(std::string element);
  Action_block(Action_block &&) = default;
  Action_block &operator=(Action_block &&) = default;
};

class Trailing_assign_opt : public Node {
public:
  Trailing_assign_opt(std::string element);
  Trailing_assign_opt(Trailing_assign_opt &&) = default;
  Trailing_assign_opt &operator=(Trailing_assign_opt &&) = default;
};

class Class_item : public Node {
public:
  Class_item(std::string element);
  Class_item(Class_item &&) = default;
  Class_item &operator=(Class_item &&) = default;
};

class Enum_name_list_trailing_comma : public Node {
public:
  Enum_name_list_trailing_comma(std::string element);
  Enum_name_list_trailing_comma(Enum_name_list_trailing_comma &&) = default;
  Enum_name_list_trailing_comma &
  operator=(Enum_name_list_trailing_comma &&) = default;
};

class Udp_port_list : public Node {
public:
  Udp_port_list(std::string element);
  Udp_port_list(Udp_port_list &&) = default;
  Udp_port_list &operator=(Udp_port_list &&) = default;
};

class Equiv_impl_expr : public Node {
public:
  Equiv_impl_expr(std::string element);
  Equiv_impl_expr(Equiv_impl_expr &&) = default;
  Equiv_impl_expr &operator=(Equiv_impl_expr &&) = default;
};

class Class_new : public Node {
public:
  Class_new(std::string element);
  Class_new(Class_new &&) = default;
  Class_new &operator=(Class_new &&) = default;
};

class Port_net_type : public Node {
public:
  Port_net_type(std::string element);
  Port_net_type(Port_net_type &&) = default;
  Port_net_type &operator=(Port_net_type &&) = default;
};

class Unqualified_id : public Node {
public:
  Unqualified_id(std::string element);
  Unqualified_id(Unqualified_id &&) = default;
  Unqualified_id &operator=(Unqualified_id &&) = default;
};

class Begin : public Node {
public:
  Begin(std::string element);
  Begin(Begin &&) = default;
  Begin &operator=(Begin &&) = default;
};

class System_tf_call : public Node {
public:
  System_tf_call(std::string element);
  System_tf_call(System_tf_call &&) = default;
  System_tf_call &operator=(System_tf_call &&) = default;
};

class Parameter_value_byname_list_item_last : public Node {
public:
  Parameter_value_byname_list_item_last(std::string element);
  Parameter_value_byname_list_item_last(
      Parameter_value_byname_list_item_last &&) = default;
  Parameter_value_byname_list_item_last &
  operator=(Parameter_value_byname_list_item_last &&) = default;
};

class Conditional_generate_construct : public Node {
public:
  Conditional_generate_construct(std::string element);
  Conditional_generate_construct(Conditional_generate_construct &&) = default;
  Conditional_generate_construct &
  operator=(Conditional_generate_construct &&) = default;
};

class Timescale_directive : public Node {
public:
  Timescale_directive(std::string element);
  Timescale_directive(Timescale_directive &&) = default;
  Timescale_directive &operator=(Timescale_directive &&) = default;
};

class Port_expression : public Node {
public:
  Port_expression(std::string element);
  Port_expression(Port_expression &&) = default;
  Port_expression &operator=(Port_expression &&) = default;
};

class Udp_sequ_entry_list : public Node {
public:
  Udp_sequ_entry_list(std::string element);
  Udp_sequ_entry_list(Udp_sequ_entry_list &&) = default;
  Udp_sequ_entry_list &operator=(Udp_sequ_entry_list &&) = default;
};

class Symbol_or_label : public Node {
public:
  Symbol_or_label(std::string element);
  Symbol_or_label(Symbol_or_label &&) = default;
  Symbol_or_label &operator=(Symbol_or_label &&) = default;
};

class Simple_sequence_expr : public Node {
public:
  Simple_sequence_expr(std::string element);
  Simple_sequence_expr(Simple_sequence_expr &&) = default;
  Simple_sequence_expr &operator=(Simple_sequence_expr &&) = default;
};

class Systemtfidentifier : public Node {
public:
  Systemtfidentifier(std::string element);
  Systemtfidentifier(Systemtfidentifier &&) = default;
  Systemtfidentifier &operator=(Systemtfidentifier &&) = default;
};

class Tk_unbasednumber : public Node {
public:
  Tk_unbasednumber(std::string element);
  Tk_unbasednumber(Tk_unbasednumber &&) = default;
  Tk_unbasednumber &operator=(Tk_unbasednumber &&) = default;
};

class Decl_dimensions_opt : public Node {
public:
  Decl_dimensions_opt(std::string element);
  Decl_dimensions_opt(Decl_dimensions_opt &&) = default;
  Decl_dimensions_opt &operator=(Decl_dimensions_opt &&) = default;
};

class Class_items_opt : public Node {
public:
  Class_items_opt(std::string element);
  Class_items_opt(Class_items_opt &&) = default;
  Class_items_opt &operator=(Class_items_opt &&) = default;
};

class Enum_name : public Node {
public:
  Enum_name(std::string element);
  Enum_name(Enum_name &&) = default;
  Enum_name &operator=(Enum_name &&) = default;
};

class Parameter_value_opt : public Node {
public:
  Parameter_value_opt(std::string element);
  Parameter_value_opt(Parameter_value_opt &&) = default;
  Parameter_value_opt &operator=(Parameter_value_opt &&) = default;
};

class Specify_edge_path : public Node {
public:
  Specify_edge_path(std::string element);
  Specify_edge_path(Specify_edge_path &&) = default;
  Specify_edge_path &operator=(Specify_edge_path &&) = default;
};

class Implicit_class_handle : public Node {
public:
  Implicit_class_handle(std::string element);
  Implicit_class_handle(Implicit_class_handle &&) = default;
  Implicit_class_handle &operator=(Implicit_class_handle &&) = default;
};

class Module_item : public Node {
public:
  Module_item(std::string element);
  Module_item(Module_item &&) = default;
  Module_item &operator=(Module_item &&) = default;
};

class Statement_item : public Node {
public:
  Statement_item(std::string element);
  Statement_item(Statement_item &&) = default;
  Statement_item &operator=(Statement_item &&) = default;
};

class Type_identifier_followed_by_id : public Node {
public:
  Type_identifier_followed_by_id(std::string element);
  Type_identifier_followed_by_id(Type_identifier_followed_by_id &&) = default;
  Type_identifier_followed_by_id &
  operator=(Type_identifier_followed_by_id &&) = default;
};

class Method_prototype : public Node {
public:
  Method_prototype(std::string element);
  Method_prototype(Method_prototype &&) = default;
  Method_prototype &operator=(Method_prototype &&) = default;
};

class Tf_port_item : public Node {
public:
  Tf_port_item(std::string element);
  Tf_port_item(Tf_port_item &&) = default;
  Tf_port_item &operator=(Tf_port_item &&) = default;
};

class Block_item_or_statement_or_null_list : public Node {
public:
  Block_item_or_statement_or_null_list(std::string element);
  Block_item_or_statement_or_null_list(
      Block_item_or_statement_or_null_list &&) = default;
  Block_item_or_statement_or_null_list &
  operator=(Block_item_or_statement_or_null_list &&) = default;
};

class Endnew_opt : public Node {
public:
  Endnew_opt(std::string element);
  Endnew_opt(Endnew_opt &&) = default;
  Endnew_opt &operator=(Endnew_opt &&) = default;
};

class Specify_item_list_opt : public Node {
public:
  Specify_item_list_opt(std::string element);
  Specify_item_list_opt(Specify_item_list_opt &&) = default;
  Specify_item_list_opt &operator=(Specify_item_list_opt &&) = default;
};

class Specify_simple_path_decl : public Node {
public:
  Specify_simple_path_decl(std::string element);
  Specify_simple_path_decl(Specify_simple_path_decl &&) = default;
  Specify_simple_path_decl &operator=(Specify_simple_path_decl &&) = default;
};

class Tk_rs_eq : public Node {
public:
  Tk_rs_eq(std::string element);
  Tk_rs_eq(Tk_rs_eq &&) = default;
  Tk_rs_eq &operator=(Tk_rs_eq &&) = default;
};

class Package_import_item_list : public Node {
public:
  Package_import_item_list(std::string element);
  Package_import_item_list(Package_import_item_list &&) = default;
  Package_import_item_list &operator=(Package_import_item_list &&) = default;
};

class Udp_port_decl : public Node {
public:
  Udp_port_decl(std::string element);
  Udp_port_decl(Udp_port_decl &&) = default;
  Udp_port_decl &operator=(Udp_port_decl &&) = default;
};

class With_exprs_suffix : public Node {
public:
  With_exprs_suffix(std::string element);
  With_exprs_suffix(With_exprs_suffix &&) = default;
  With_exprs_suffix &operator=(With_exprs_suffix &&) = default;
};

class Generate_region : public Node {
public:
  Generate_region(std::string element);
  Generate_region(Generate_region &&) = default;
  Generate_region &operator=(Generate_region &&) = default;
};

class Call_base : public Node {
public:
  Call_base(std::string element);
  Call_base(Call_base &&) = default;
  Call_base &operator=(Call_base &&) = default;
};

class Array_locator_method : public Node {
public:
  Array_locator_method(std::string element);
  Array_locator_method(Array_locator_method &&) = default;
  Array_locator_method &operator=(Array_locator_method &&) = default;
};

class Port_declaration_ansi : public Node {
public:
  Port_declaration_ansi(std::string element);
  Port_declaration_ansi(Port_declaration_ansi &&) = default;
  Port_declaration_ansi &operator=(Port_declaration_ansi &&) = default;
};

class Bitand_expr : public Node {
public:
  Bitand_expr(std::string element);
  Bitand_expr(Bitand_expr &&) = default;
  Bitand_expr &operator=(Bitand_expr &&) = default;
};

class Range_list_in_braces : public Node {
public:
  Range_list_in_braces(std::string element);
  Range_list_in_braces(Range_list_in_braces &&) = default;
  Range_list_in_braces &operator=(Range_list_in_braces &&) = default;
};

class Module_parameter_port_list_item_last : public Node {
public:
  Module_parameter_port_list_item_last(std::string element);
  Module_parameter_port_list_item_last(
      Module_parameter_port_list_item_last &&) = default;
  Module_parameter_port_list_item_last &
  operator=(Module_parameter_port_list_item_last &&) = default;
};

class Hex_based_number : public Node {
public:
  Hex_based_number(std::string element);
  Hex_based_number(Hex_based_number &&) = default;
  Hex_based_number &operator=(Hex_based_number &&) = default;
};

class Hierarchy_event_identifier : public Node {
public:
  Hierarchy_event_identifier(std::string element);
  Hierarchy_event_identifier(Hierarchy_event_identifier &&) = default;
  Hierarchy_event_identifier &
  operator=(Hierarchy_event_identifier &&) = default;
};

class List_of_variable_decl_assignments : public Node {
public:
  List_of_variable_decl_assignments(std::string element);
  List_of_variable_decl_assignments(List_of_variable_decl_assignments &&) =
      default;
  List_of_variable_decl_assignments &
  operator=(List_of_variable_decl_assignments &&) = default;
};

class Random_qualifier_opt : public Node {
public:
  Random_qualifier_opt(std::string element);
  Random_qualifier_opt(Random_qualifier_opt &&) = default;
  Random_qualifier_opt &operator=(Random_qualifier_opt &&) = default;
};

class Drive_strength_opt : public Node {
public:
  Drive_strength_opt(std::string element);
  Drive_strength_opt(Drive_strength_opt &&) = default;
  Drive_strength_opt &operator=(Drive_strength_opt &&) = default;
};

class Tk_timeliteral : public Node {
public:
  Tk_timeliteral(std::string element);
  Tk_timeliteral(Tk_timeliteral &&) = default;
  Tk_timeliteral &operator=(Tk_timeliteral &&) = default;
};

class Value_range : public Node {
public:
  Value_range(std::string element);
  Value_range(Value_range &&) = default;
  Value_range &operator=(Value_range &&) = default;
};

class Expr_mintypmax_generalized : public Node {
public:
  Expr_mintypmax_generalized(std::string element);
  Expr_mintypmax_generalized(Expr_mintypmax_generalized &&) = default;
  Expr_mintypmax_generalized &
  operator=(Expr_mintypmax_generalized &&) = default;
};

class Polarity_operator : public Node {
public:
  Polarity_operator(std::string element);
  Polarity_operator(Polarity_operator &&) = default;
  Polarity_operator &operator=(Polarity_operator &&) = default;
};

class Package_item : public Node {
public:
  Package_item(std::string element);
  Package_item(Package_item &&) = default;
  Package_item &operator=(Package_item &&) = default;
};

class For_initialization : public Node {
public:
  For_initialization(std::string element);
  For_initialization(For_initialization &&) = default;
  For_initialization &operator=(For_initialization &&) = default;
};

class Enum_data_type : public Node {
public:
  Enum_data_type(std::string element);
  Enum_data_type(Enum_data_type &&) = default;
  Enum_data_type &operator=(Enum_data_type &&) = default;
};

class Blocking_assignment : public Node {
public:
  Blocking_assignment(std::string element);
  Blocking_assignment(Blocking_assignment &&) = default;
  Blocking_assignment &operator=(Blocking_assignment &&) = default;
};

class Delay1 : public Node {
public:
  Delay1(std::string element);
  Delay1(Delay1 &&) = default;
  Delay1 &operator=(Delay1 &&) = default;
};

class Based_number : public Node {
public:
  Based_number(std::string element);
  Based_number(Based_number &&) = default;
  Based_number &operator=(Based_number &&) = default;
};

class Procedural_timing_control_statement : public Node {
public:
  Procedural_timing_control_statement(std::string element);
  Procedural_timing_control_statement(Procedural_timing_control_statement &&) =
      default;
  Procedural_timing_control_statement &
  operator=(Procedural_timing_control_statement &&) = default;
};

class Block_item_decl : public Node {
public:
  Block_item_decl(std::string element);
  Block_item_decl(Block_item_decl &&) = default;
  Block_item_decl &operator=(Block_item_decl &&) = default;
};

class Net_variable_or_decl_assigns : public Node {
public:
  Net_variable_or_decl_assigns(std::string element);
  Net_variable_or_decl_assigns(Net_variable_or_decl_assigns &&) = default;
  Net_variable_or_decl_assigns &
  operator=(Net_variable_or_decl_assigns &&) = default;
};

class Time_literal : public Node {
public:
  Time_literal(std::string element);
  Time_literal(Time_literal &&) = default;
  Time_literal &operator=(Time_literal &&) = default;
};

class Function_item_data_declaration : public Node {
public:
  Function_item_data_declaration(std::string element);
  Function_item_data_declaration(Function_item_data_declaration &&) = default;
  Function_item_data_declaration &
  operator=(Function_item_data_declaration &&) = default;
};

class Decl_variable_dimension : public Node {
public:
  Decl_variable_dimension(std::string element);
  Decl_variable_dimension(Decl_variable_dimension &&) = default;
  Decl_variable_dimension &operator=(Decl_variable_dimension &&) = default;
};

class Tf_port_list_opt : public Node {
public:
  Tf_port_list_opt(std::string element);
  Tf_port_list_opt(Tf_port_list_opt &&) = default;
  Tf_port_list_opt &operator=(Tf_port_list_opt &&) = default;
};

class Endfunction_label_opt : public Node {
public:
  Endfunction_label_opt(std::string element);
  Endfunction_label_opt(Endfunction_label_opt &&) = default;
  Endfunction_label_opt &operator=(Endfunction_label_opt &&) = default;
};

class Qualified_id : public Node {
public:
  Qualified_id(std::string element);
  Qualified_id(Qualified_id &&) = default;
  Qualified_id &operator=(Qualified_id &&) = default;
};

class Immediate_assertion_statement : public Node {
public:
  Immediate_assertion_statement(std::string element);
  Immediate_assertion_statement(Immediate_assertion_statement &&) = default;
  Immediate_assertion_statement &
  operator=(Immediate_assertion_statement &&) = default;
};

class Join_keyword : public Node {
public:
  Join_keyword(std::string element);
  Join_keyword(Join_keyword &&) = default;
  Join_keyword &operator=(Join_keyword &&) = default;
};

class Tk_bindigits : public Node {
public:
  Tk_bindigits(std::string element);
  Tk_bindigits(Tk_bindigits &&) = default;
  Tk_bindigits &operator=(Tk_bindigits &&) = default;
};

class Event_trigger : public Node {
public:
  Event_trigger(std::string element);
  Event_trigger(Event_trigger &&) = default;
  Event_trigger &operator=(Event_trigger &&) = default;
};

class Dynamic_array_new : public Node {
public:
  Dynamic_array_new(std::string element);
  Dynamic_array_new(Dynamic_array_new &&) = default;
  Dynamic_array_new &operator=(Dynamic_array_new &&) = default;
};

class Matches_expr : public Node {
public:
  Matches_expr(std::string element);
  Matches_expr(Matches_expr &&) = default;
  Matches_expr &operator=(Matches_expr &&) = default;
};

class Port_reference_list : public Node {
public:
  Port_reference_list(std::string element);
  Port_reference_list(Port_reference_list &&) = default;
  Port_reference_list &operator=(Port_reference_list &&) = default;
};

class Array_reduction_method : public Node {
public:
  Array_reduction_method(std::string element);
  Array_reduction_method(Array_reduction_method &&) = default;
  Array_reduction_method &operator=(Array_reduction_method &&) = default;
};

class Builtin_array_method : public Node {
public:
  Builtin_array_method(std::string element);
  Builtin_array_method(Builtin_array_method &&) = default;
  Builtin_array_method &operator=(Builtin_array_method &&) = default;
};

class Package_declaration : public Node {
public:
  Package_declaration(std::string element);
  Package_declaration(Package_declaration &&) = default;
  Package_declaration &operator=(Package_declaration &&) = default;
};

class Assignment_pattern_expression : public Node {
public:
  Assignment_pattern_expression(std::string element);
  Assignment_pattern_expression(Assignment_pattern_expression &&) = default;
  Assignment_pattern_expression &
  operator=(Assignment_pattern_expression &&) = default;
};

class Drive_strength : public Node {
public:
  Drive_strength(std::string element);
  Drive_strength(Drive_strength &&) = default;
  Drive_strength &operator=(Drive_strength &&) = default;
};

class Port_declaration_non_ansi : public Node {
public:
  Port_declaration_non_ansi(std::string element);
  Port_declaration_non_ansi(Port_declaration_non_ansi &&) = default;
  Port_declaration_non_ansi &operator=(Port_declaration_non_ansi &&) = default;
};

class Module_parameter_port_list : public Node {
public:
  Module_parameter_port_list(std::string element);
  Module_parameter_port_list(Module_parameter_port_list &&) = default;
  Module_parameter_port_list &
  operator=(Module_parameter_port_list &&) = default;
};

class Var_type : public Node {
public:
  Var_type(std::string element);
  Var_type(Var_type &&) = default;
  Var_type &operator=(Var_type &&) = default;
};

class Parameter_opt : public Node {
public:
  Parameter_opt(std::string element);
  Parameter_opt(Parameter_opt &&) = default;
  Parameter_opt &operator=(Parameter_opt &&) = default;
};

class Module_item_list : public Node {
public:
  Module_item_list(std::string element);
  Module_item_list(Module_item_list &&) = default;
  Module_item_list &operator=(Module_item_list &&) = default;
};

class Genericidentifier : public Node {
public:
  Genericidentifier(std::string element);
  Genericidentifier(Genericidentifier &&) = default;
  Genericidentifier &operator=(Genericidentifier &&) = default;
};

class Package_item_list_opt : public Node {
public:
  Package_item_list_opt(std::string element);
  Package_item_list_opt(Package_item_list_opt &&) = default;
  Package_item_list_opt &operator=(Package_item_list_opt &&) = default;
};

class List_of_ports_or_port_declarations_item_last_ansi : public Node {
public:
  List_of_ports_or_port_declarations_item_last_ansi(std::string element);
  List_of_ports_or_port_declarations_item_last_ansi(
      List_of_ports_or_port_declarations_item_last_ansi &&) = default;
  List_of_ports_or_port_declarations_item_last_ansi &
  operator=(List_of_ports_or_port_declarations_item_last_ansi &&) = default;
};

class Data_type_or_implicit_followed_by_id_and_dimensions_opt : public Node {
public:
  Data_type_or_implicit_followed_by_id_and_dimensions_opt(std::string element);
  Data_type_or_implicit_followed_by_id_and_dimensions_opt(
      Data_type_or_implicit_followed_by_id_and_dimensions_opt &&) = default;
  Data_type_or_implicit_followed_by_id_and_dimensions_opt &operator=(
      Data_type_or_implicit_followed_by_id_and_dimensions_opt &&) = default;
};

class Xor_expr : public Node {
public:
  Xor_expr(std::string element);
  Xor_expr(Xor_expr &&) = default;
  Xor_expr &operator=(Xor_expr &&) = default;
};

class Dec_based_number : public Node {
public:
  Dec_based_number(std::string element);
  Dec_based_number(Dec_based_number &&) = default;
  Dec_based_number &operator=(Dec_based_number &&) = default;
};

class Loop_statement : public Node {
public:
  Loop_statement(std::string element);
  Loop_statement(Loop_statement &&) = default;
  Loop_statement &operator=(Loop_statement &&) = default;
};

class Data_declaration_or_module_instantiation : public Node {
public:
  Data_declaration_or_module_instantiation(std::string element);
  Data_declaration_or_module_instantiation(
      Data_declaration_or_module_instantiation &&) = default;
  Data_declaration_or_module_instantiation &
  operator=(Data_declaration_or_module_instantiation &&) = default;
};

class Udp_comb_entry_list : public Node {
public:
  Udp_comb_entry_list(std::string element);
  Udp_comb_entry_list(Udp_comb_entry_list &&) = default;
  Udp_comb_entry_list &operator=(Udp_comb_entry_list &&) = default;
};

class Bit_logic : public Node {
public:
  Bit_logic(std::string element);
  Bit_logic(Bit_logic &&) = default;
  Bit_logic &operator=(Bit_logic &&) = default;
};

class Reference_or_call : public Node {
public:
  Reference_or_call(std::string element);
  Reference_or_call(Reference_or_call &&) = default;
  Reference_or_call &operator=(Reference_or_call &&) = default;
};

class Local_root : public Node {
public:
  Local_root(std::string element);
  Local_root(Local_root &&) = default;
  Local_root &operator=(Local_root &&) = default;
};

class Port_direction : public Node {
public:
  Port_direction(std::string element);
  Port_direction(Port_direction &&) = default;
  Port_direction &operator=(Port_direction &&) = default;
};

class Variable_decl_assignment : public Node {
public:
  Variable_decl_assignment(std::string element);
  Variable_decl_assignment(Variable_decl_assignment &&) = default;
  Variable_decl_assignment &operator=(Variable_decl_assignment &&) = default;
};

class Specify_edge_path_decl : public Node {
public:
  Specify_edge_path_decl(std::string element);
  Specify_edge_path_decl(Specify_edge_path_decl &&) = default;
  Specify_edge_path_decl &operator=(Specify_edge_path_decl &&) = default;
};

class Function_prototype : public Node {
public:
  Function_prototype(std::string element);
  Function_prototype(Function_prototype &&) = default;
  Function_prototype &operator=(Function_prototype &&) = default;
};

class Sequence_within_expr : public Node {
public:
  Sequence_within_expr(std::string element);
  Sequence_within_expr(Sequence_within_expr &&) = default;
  Sequence_within_expr &operator=(Sequence_within_expr &&) = default;
};

class Expr_primary_no_groups : public Node {
public:
  Expr_primary_no_groups(std::string element);
  Expr_primary_no_groups(Expr_primary_no_groups &&) = default;
  Expr_primary_no_groups &operator=(Expr_primary_no_groups &&) = default;
};

class Parameter_value_byname : public Node {
public:
  Parameter_value_byname(std::string element);
  Parameter_value_byname(Parameter_value_byname &&) = default;
  Parameter_value_byname &operator=(Parameter_value_byname &&) = default;
};

class Case_any : public Node {
public:
  Case_any(std::string element);
  Case_any(Case_any &&) = default;
  Case_any &operator=(Case_any &&) = default;
};

class Spec_notifier : public Node {
public:
  Spec_notifier(std::string element);
  Spec_notifier(Spec_notifier &&) = default;
  Spec_notifier &operator=(Spec_notifier &&) = default;
};

class Block_item_or_statement_or_null : public Node {
public:
  Block_item_or_statement_or_null(std::string element);
  Block_item_or_statement_or_null(Block_item_or_statement_or_null &&) = default;
  Block_item_or_statement_or_null &
  operator=(Block_item_or_statement_or_null &&) = default;
};

class Specify_item : public Node {
public:
  Specify_item(std::string element);
  Specify_item(Specify_item &&) = default;
  Specify_item &operator=(Specify_item &&) = default;
};

class Any_param_declaration : public Node {
public:
  Any_param_declaration(std::string element);
  Any_param_declaration(Any_param_declaration &&) = default;
  Any_param_declaration &operator=(Any_param_declaration &&) = default;
};

class Tf_port_list_trailing_comma : public Node {
public:
  Tf_port_list_trailing_comma(std::string element);
  Tf_port_list_trailing_comma(Tf_port_list_trailing_comma &&) = default;
  Tf_port_list_trailing_comma &
  operator=(Tf_port_list_trailing_comma &&) = default;
};

class Struct_union_member : public Node {
public:
  Struct_union_member(std::string element);
  Struct_union_member(Struct_union_member &&) = default;
  Struct_union_member &operator=(Struct_union_member &&) = default;
};

class Any_port_list_positional : public Node {
public:
  Any_port_list_positional(std::string element);
  Any_port_list_positional(Any_port_list_positional &&) = default;
  Any_port_list_positional &operator=(Any_port_list_positional &&) = default;
};

class Dir : public Node {
public:
  Dir(std::string element);
  Dir(Dir &&) = default;
  Dir &operator=(Dir &&) = default;
};

class Lifetime_opt : public Node {
public:
  Lifetime_opt(std::string element);
  Lifetime_opt(Lifetime_opt &&) = default;
  Lifetime_opt &operator=(Lifetime_opt &&) = default;
};

class List_of_identifiers : public Node {
public:
  List_of_identifiers(std::string element);
  List_of_identifiers(List_of_identifiers &&) = default;
  List_of_identifiers &operator=(List_of_identifiers &&) = default;
};

class Edge_operator : public Node {
public:
  Edge_operator(std::string element);
  Edge_operator(Edge_operator &&) = default;
  Edge_operator &operator=(Edge_operator &&) = default;
};

class Tk_virtual_opt : public Node {
public:
  Tk_virtual_opt(std::string element);
  Tk_virtual_opt(Tk_virtual_opt &&) = default;
  Tk_virtual_opt &operator=(Tk_virtual_opt &&) = default;
};

class Timeunits_declaration : public Node {
public:
  Timeunits_declaration(std::string element);
  Timeunits_declaration(Timeunits_declaration &&) = default;
  Timeunits_declaration &operator=(Timeunits_declaration &&) = default;
};

class Tf_item_or_statement_or_null : public Node {
public:
  Tf_item_or_statement_or_null(std::string element);
  Tf_item_or_statement_or_null(Tf_item_or_statement_or_null &&) = default;
  Tf_item_or_statement_or_null &
  operator=(Tf_item_or_statement_or_null &&) = default;
};

class Package_import_list : public Node {
public:
  Package_import_list(std::string element);
  Package_import_list(Package_import_list &&) = default;
  Package_import_list &operator=(Package_import_list &&) = default;
};

class Expr_primary : public Node {
public:
  Expr_primary(std::string element);
  Expr_primary(Expr_primary &&) = default;
  Expr_primary &operator=(Expr_primary &&) = default;
};

class Signed_unsigned_opt : public Node {
public:
  Signed_unsigned_opt(std::string element);
  Signed_unsigned_opt(Signed_unsigned_opt &&) = default;
  Signed_unsigned_opt &operator=(Signed_unsigned_opt &&) = default;
};

class Non_anonymous_gate_instance_or_register_variable_list : public Node {
public:
  Non_anonymous_gate_instance_or_register_variable_list(std::string element);
  Non_anonymous_gate_instance_or_register_variable_list(
      Non_anonymous_gate_instance_or_register_variable_list &&) = default;
  Non_anonymous_gate_instance_or_register_variable_list &
  operator=(Non_anonymous_gate_instance_or_register_variable_list &&) = default;
};

class Udp_comb_entry : public Node {
public:
  Udp_comb_entry(std::string element);
  Udp_comb_entry(Udp_comb_entry &&) = default;
  Udp_comb_entry &operator=(Udp_comb_entry &&) = default;
};

class Delay3 : public Node {
public:
  Delay3(std::string element);
  Delay3(Delay3 &&) = default;
  Delay3 &operator=(Delay3 &&) = default;
};

class Inc_or_dec_or_primary_expr : public Node {
public:
  Inc_or_dec_or_primary_expr(std::string element);
  Inc_or_dec_or_primary_expr(Inc_or_dec_or_primary_expr &&) = default;
  Inc_or_dec_or_primary_expr &
  operator=(Inc_or_dec_or_primary_expr &&) = default;
};

class Procedural_assertion_statement : public Node {
public:
  Procedural_assertion_statement(std::string element);
  Procedural_assertion_statement(Procedural_assertion_statement &&) = default;
  Procedural_assertion_statement &
  operator=(Procedural_assertion_statement &&) = default;
};

class Struct_union_member_list : public Node {
public:
  Struct_union_member_list(std::string element);
  Struct_union_member_list(Struct_union_member_list &&) = default;
  Struct_union_member_list &operator=(Struct_union_member_list &&) = default;
};

class Comp_expr : public Node {
public:
  Comp_expr(std::string element);
  Comp_expr(Comp_expr &&) = default;
  Comp_expr &operator=(Comp_expr &&) = default;
};

class Postfix_expression : public Node {
public:
  Postfix_expression(std::string element);
  Postfix_expression(Postfix_expression &&) = default;
  Postfix_expression &operator=(Postfix_expression &&) = default;
};

class Symbolidentifier : public Node {
public:
  Symbolidentifier(std::string element);
  Symbolidentifier(Symbolidentifier &&) = default;
  Symbolidentifier &operator=(Symbolidentifier &&) = default;
};

class Udp_input_sym : public Node {
public:
  Udp_input_sym(std::string element);
  Udp_input_sym(Udp_input_sym &&) = default;
  Udp_input_sym &operator=(Udp_input_sym &&) = default;
};

class Pos_neg_number : public Node {
public:
  Pos_neg_number(std::string element);
  Pos_neg_number(Pos_neg_number &&) = default;
  Pos_neg_number &operator=(Pos_neg_number &&) = default;
};

class Specify_terminal_descriptor : public Node {
public:
  Specify_terminal_descriptor(std::string element);
  Specify_terminal_descriptor(Specify_terminal_descriptor &&) = default;
  Specify_terminal_descriptor &
  operator=(Specify_terminal_descriptor &&) = default;
};

class Select_variable_dimension : public Node {
public:
  Select_variable_dimension(std::string element);
  Select_variable_dimension(Select_variable_dimension &&) = default;
  Select_variable_dimension &operator=(Select_variable_dimension &&) = default;
};

class List_of_ports_or_port_declarations_ansi : public Node {
public:
  List_of_ports_or_port_declarations_ansi(std::string element);
  List_of_ports_or_port_declarations_ansi(
      List_of_ports_or_port_declarations_ansi &&) = default;
  List_of_ports_or_port_declarations_ansi &
  operator=(List_of_ports_or_port_declarations_ansi &&) = default;
};

class Generate_case_items : public Node {
public:
  Generate_case_items(std::string element);
  Generate_case_items(Generate_case_items &&) = default;
  Generate_case_items &operator=(Generate_case_items &&) = default;
};

class Data_type_primitive_scalar : public Node {
public:
  Data_type_primitive_scalar(std::string element);
  Data_type_primitive_scalar(Data_type_primitive_scalar &&) = default;
  Data_type_primitive_scalar &
  operator=(Data_type_primitive_scalar &&) = default;
};

class Tf_item_or_statement_or_null_list : public Node {
public:
  Tf_item_or_statement_or_null_list(std::string element);
  Tf_item_or_statement_or_null_list(Tf_item_or_statement_or_null_list &&) =
      default;
  Tf_item_or_statement_or_null_list &
  operator=(Tf_item_or_statement_or_null_list &&) = default;
};

class Conditional_statement : public Node {
public:
  Conditional_statement(std::string element);
  Conditional_statement(Conditional_statement &&) = default;
  Conditional_statement &operator=(Conditional_statement &&) = default;
};

class Specparam_decl : public Node {
public:
  Specparam_decl(std::string element);
  Specparam_decl(Specparam_decl &&) = default;
  Specparam_decl &operator=(Specparam_decl &&) = default;
};

class List_of_ports_or_port_declarations_non_ansi : public Node {
public:
  List_of_ports_or_port_declarations_non_ansi(std::string element);
  List_of_ports_or_port_declarations_non_ansi(
      List_of_ports_or_port_declarations_non_ansi &&) = default;
  List_of_ports_or_port_declarations_non_ansi &
  operator=(List_of_ports_or_port_declarations_non_ansi &&) = default;
};

class Statement_or_null_list : public Node {
public:
  Statement_or_null_list(std::string element);
  Statement_or_null_list(Statement_or_null_list &&) = default;
  Statement_or_null_list &operator=(Statement_or_null_list &&) = default;
};

class Task_declaration : public Node {
public:
  Task_declaration(std::string element);
  Task_declaration(Task_declaration &&) = default;
  Task_declaration &operator=(Task_declaration &&) = default;
};

class Data_declaration_base : public Node {
public:
  Data_declaration_base(std::string element);
  Data_declaration_base(Data_declaration_base &&) = default;
  Data_declaration_base &operator=(Data_declaration_base &&) = default;
};

class Any_port_list_opt : public Node {
public:
  Any_port_list_opt(std::string element);
  Any_port_list_opt(Any_port_list_opt &&) = default;
  Any_port_list_opt &operator=(Any_port_list_opt &&) = default;
};

class Macronumericwidth : public Node {
public:
  Macronumericwidth(std::string element);
  Macronumericwidth(Macronumericwidth &&) = default;
  Macronumericwidth &operator=(Macronumericwidth &&) = default;
};

class Trailing_decl_assignment_opt : public Node {
public:
  Trailing_decl_assignment_opt(std::string element);
  Trailing_decl_assignment_opt(Trailing_decl_assignment_opt &&) = default;
  Trailing_decl_assignment_opt &
  operator=(Trailing_decl_assignment_opt &&) = default;
};

class Gate_instance_or_register_variable : public Node {
public:
  Gate_instance_or_register_variable(std::string element);
  Gate_instance_or_register_variable(Gate_instance_or_register_variable &&) =
      default;
  Gate_instance_or_register_variable &
  operator=(Gate_instance_or_register_variable &&) = default;
};

class Bind_instantiation : public Node {
public:
  Bind_instantiation(std::string element);
  Bind_instantiation(Bind_instantiation &&) = default;
  Bind_instantiation &operator=(Bind_instantiation &&) = default;
};

class Package_import_declaration : public Node {
public:
  Package_import_declaration(std::string element);
  Package_import_declaration(Package_import_declaration &&) = default;
  Package_import_declaration &
  operator=(Package_import_declaration &&) = default;
};

class Module_package_import_list_opt : public Node {
public:
  Module_package_import_list_opt(std::string element);
  Module_package_import_list_opt(Module_package_import_list_opt &&) = default;
  Module_package_import_list_opt &
  operator=(Module_package_import_list_opt &&) = default;
};

class Structure_or_array_pattern_expression_list : public Node {
public:
  Structure_or_array_pattern_expression_list(std::string element);
  Structure_or_array_pattern_expression_list(
      Structure_or_array_pattern_expression_list &&) = default;
  Structure_or_array_pattern_expression_list &
  operator=(Structure_or_array_pattern_expression_list &&) = default;
};

class Event_expression_list : public Node {
public:
  Event_expression_list(std::string element);
  Event_expression_list(Event_expression_list &&) = default;
  Event_expression_list &operator=(Event_expression_list &&) = default;
};

class Tk_rss_eq : public Node {
public:
  Tk_rss_eq(std::string element);
  Tk_rss_eq(Tk_rss_eq &&) = default;
  Tk_rss_eq &operator=(Tk_rss_eq &&) = default;
};

class Implements_interface_list_opt : public Node {
public:
  Implements_interface_list_opt(std::string element);
  Implements_interface_list_opt(Implements_interface_list_opt &&) = default;
  Implements_interface_list_opt &
  operator=(Implements_interface_list_opt &&) = default;
};

class Delay3_opt : public Node {
public:
  Delay3_opt(std::string element);
  Delay3_opt(Delay3_opt &&) = default;
  Delay3_opt &operator=(Delay3_opt &&) = default;
};

class Expr_mintypmax_trans_set : public Node {
public:
  Expr_mintypmax_trans_set(std::string element);
  Expr_mintypmax_trans_set(Expr_mintypmax_trans_set &&) = default;
  Expr_mintypmax_trans_set &operator=(Expr_mintypmax_trans_set &&) = default;
};

class Statement_or_null : public Node {
public:
  Statement_or_null(std::string element);
  Statement_or_null(Statement_or_null &&) = default;
  Statement_or_null &operator=(Statement_or_null &&) = default;
};

class Enum_name_list : public Node {
public:
  Enum_name_list(std::string element);
  Enum_name_list(Enum_name_list &&) = default;
  Enum_name_list &operator=(Enum_name_list &&) = default;
};

class Sequence_unary_expr : public Node {
public:
  Sequence_unary_expr(std::string element);
  Sequence_unary_expr(Sequence_unary_expr &&) = default;
  Sequence_unary_expr &operator=(Sequence_unary_expr &&) = default;
};

class Pp_identifier : public Node {
public:
  Pp_identifier(std::string element);
  Pp_identifier(Pp_identifier &&) = default;
  Pp_identifier &operator=(Pp_identifier &&) = default;
};

class Shift_expr : public Node {
public:
  Shift_expr(std::string element);
  Shift_expr(Shift_expr &&) = default;
  Shift_expr &operator=(Shift_expr &&) = default;
};

class Oct_based_number : public Node {
public:
  Oct_based_number(std::string element);
  Oct_based_number(Oct_based_number &&) = default;
  Oct_based_number &operator=(Oct_based_number &&) = default;
};

class Hierarchy_segment : public Node {
public:
  Hierarchy_segment(std::string element);
  Hierarchy_segment(Hierarchy_segment &&) = default;
  Hierarchy_segment &operator=(Hierarchy_segment &&) = default;
};

class Nonblocking_assignment : public Node {
public:
  Nonblocking_assignment(std::string element);
  Nonblocking_assignment(Nonblocking_assignment &&) = default;
  Nonblocking_assignment &operator=(Nonblocking_assignment &&) = default;
};

class Expression_list_proper : public Node {
public:
  Expression_list_proper(std::string element);
  Expression_list_proper(Expression_list_proper &&) = default;
  Expression_list_proper &operator=(Expression_list_proper &&) = default;
};

class Generate_if : public Node {
public:
  Generate_if(std::string element);
  Generate_if(Generate_if &&) = default;
  Generate_if &operator=(Generate_if &&) = default;
};

class Function_item : public Node {
public:
  Function_item(std::string element);
  Function_item(Function_item &&) = default;
  Function_item &operator=(Function_item &&) = default;
};

class Scope_prefix : public Node {
public:
  Scope_prefix(std::string element);
  Scope_prefix(Scope_prefix &&) = default;
  Scope_prefix &operator=(Scope_prefix &&) = default;
};

class Primitive_gate_instance_list : public Node {
public:
  Primitive_gate_instance_list(std::string element);
  Primitive_gate_instance_list(Primitive_gate_instance_list &&) = default;
  Primitive_gate_instance_list &
  operator=(Primitive_gate_instance_list &&) = default;
};

class Simple_immediate_assertion_statement : public Node {
public:
  Simple_immediate_assertion_statement(std::string element);
  Simple_immediate_assertion_statement(
      Simple_immediate_assertion_statement &&) = default;
  Simple_immediate_assertion_statement &
  operator=(Simple_immediate_assertion_statement &&) = default;
};

class Description_list : public Node {
public:
  Description_list(std::string element);
  Description_list(Description_list &&) = default;
  Description_list &operator=(Description_list &&) = default;
};

class Dr_strength0 : public Node {
public:
  Dr_strength0(std::string element);
  Dr_strength0(Dr_strength0 &&) = default;
  Dr_strength0 &operator=(Dr_strength0 &&) = default;
};

class Unique_priority_opt : public Node {
public:
  Unique_priority_opt(std::string element);
  Unique_priority_opt(Unique_priority_opt &&) = default;
  Unique_priority_opt &operator=(Unique_priority_opt &&) = default;
};

class Specparam : public Node {
public:
  Specparam(std::string element);
  Specparam(Specparam &&) = default;
  Specparam &operator=(Specparam &&) = default;
};

class Port_expression_opt : public Node {
public:
  Port_expression_opt(std::string element);
  Port_expression_opt(Port_expression_opt &&) = default;
  Port_expression_opt &operator=(Port_expression_opt &&) = default;
};

class Cond_expr : public Node {
public:
  Cond_expr(std::string element);
  Cond_expr(Cond_expr &&) = default;
  Cond_expr &operator=(Cond_expr &&) = default;
};

class Tk_reg_opt : public Node {
public:
  Tk_reg_opt(std::string element);
  Tk_reg_opt(Tk_reg_opt &&) = default;
  Tk_reg_opt &operator=(Tk_reg_opt &&) = default;
};

class Logor_expr : public Node {
public:
  Logor_expr(std::string element);
  Logor_expr(Logor_expr &&) = default;
  Logor_expr &operator=(Logor_expr &&) = default;
};

class Delay3_or_drive_opt : public Node {
public:
  Delay3_or_drive_opt(std::string element);
  Delay3_or_drive_opt(Delay3_or_drive_opt &&) = default;
  Delay3_or_drive_opt &operator=(Delay3_or_drive_opt &&) = default;
};

class Tf_item_or_statement_or_null_list_opt : public Node {
public:
  Tf_item_or_statement_or_null_list_opt(std::string element);
  Tf_item_or_statement_or_null_list_opt(
      Tf_item_or_statement_or_null_list_opt &&) = default;
  Tf_item_or_statement_or_null_list_opt &
  operator=(Tf_item_or_statement_or_null_list_opt &&) = default;
};

class Net_decl_assign : public Node {
public:
  Net_decl_assign(std::string element);
  Net_decl_assign(Net_decl_assign &&) = default;
  Net_decl_assign &operator=(Net_decl_assign &&) = default;
};

class Always_any : public Node {
public:
  Always_any(std::string element);
  Always_any(Always_any &&) = default;
  Always_any &operator=(Always_any &&) = default;
};

class List_of_tf_variable_identifiers : public Node {
public:
  List_of_tf_variable_identifiers(std::string element);
  List_of_tf_variable_identifiers(List_of_tf_variable_identifiers &&) = default;
  List_of_tf_variable_identifiers &
  operator=(List_of_tf_variable_identifiers &&) = default;
};

class Var_or_net_type_opt : public Node {
public:
  Var_or_net_type_opt(std::string element);
  Var_or_net_type_opt(Var_or_net_type_opt &&) = default;
  Var_or_net_type_opt &operator=(Var_or_net_type_opt &&) = default;
};

class Tf_port_list_item_last : public Node {
public:
  Tf_port_list_item_last(std::string element);
  Tf_port_list_item_last(Tf_port_list_item_last &&) = default;
  Tf_port_list_item_last &operator=(Tf_port_list_item_last &&) = default;
};

class Task_declaration_id : public Node {
public:
  Task_declaration_id(std::string element);
  Task_declaration_id(Task_declaration_id &&) = default;
  Task_declaration_id &operator=(Task_declaration_id &&) = default;
};

class Instantiation_base : public Node {
public:
  Instantiation_base(std::string element);
  Instantiation_base(Instantiation_base &&) = default;
  Instantiation_base &operator=(Instantiation_base &&) = default;
};

class Sequence_repetition_expr : public Node {
public:
  Sequence_repetition_expr(std::string element);
  Sequence_repetition_expr(Sequence_repetition_expr &&) = default;
  Sequence_repetition_expr &operator=(Sequence_repetition_expr &&) = default;
};

class Tk_hexdigits : public Node {
public:
  Tk_hexdigits(std::string element);
  Tk_hexdigits(Tk_hexdigits &&) = default;
  Tk_hexdigits &operator=(Tk_hexdigits &&) = default;
};

class Non_anonymous_gate_instance_or_register_variable : public Node {
public:
  Non_anonymous_gate_instance_or_register_variable(std::string element);
  Non_anonymous_gate_instance_or_register_variable(
      Non_anonymous_gate_instance_or_register_variable &&) = default;
  Non_anonymous_gate_instance_or_register_variable &
  operator=(Non_anonymous_gate_instance_or_register_variable &&) = default;
};

class Localparam_assign : public Node {
public:
  Localparam_assign(std::string element);
  Localparam_assign(Localparam_assign &&) = default;
  Localparam_assign &operator=(Localparam_assign &&) = default;
};

class Class_items : public Node {
public:
  Class_items(std::string element);
  Class_items(Class_items &&) = default;
  Class_items &operator=(Class_items &&) = default;
};

class Expression_in_parens : public Node {
public:
  Expression_in_parens(std::string element);
  Expression_in_parens(Expression_in_parens &&) = default;
  Expression_in_parens &operator=(Expression_in_parens &&) = default;
};

class List_of_ports_or_port_declarations_trailing_comma_ansi : public Node {
public:
  List_of_ports_or_port_declarations_trailing_comma_ansi(std::string element);
  List_of_ports_or_port_declarations_trailing_comma_ansi(
      List_of_ports_or_port_declarations_trailing_comma_ansi &&) = default;
  List_of_ports_or_port_declarations_trailing_comma_ansi &operator=(
      List_of_ports_or_port_declarations_trailing_comma_ansi &&) = default;
};

class Port_reference : public Node {
public:
  Port_reference(std::string element);
  Port_reference(Port_reference &&) = default;
  Port_reference &operator=(Port_reference &&) = default;
};

class Dist_opt : public Node {
public:
  Dist_opt(std::string element);
  Dist_opt(Dist_opt &&) = default;
  Dist_opt &operator=(Dist_opt &&) = default;
};

class Caseeq_expr : public Node {
public:
  Caseeq_expr(std::string element);
  Caseeq_expr(Caseeq_expr &&) = default;
  Caseeq_expr &operator=(Caseeq_expr &&) = default;
};

class Generate_block : public Node {
public:
  Generate_block(std::string element);
  Generate_block(Generate_block &&) = default;
  Generate_block &operator=(Generate_block &&) = default;
};

class List_of_ports_or_port_declarations_item_last_non_ansi : public Node {
public:
  List_of_ports_or_port_declarations_item_last_non_ansi(std::string element);
  List_of_ports_or_port_declarations_item_last_non_ansi(
      List_of_ports_or_port_declarations_item_last_non_ansi &&) = default;
  List_of_ports_or_port_declarations_item_last_non_ansi &
  operator=(List_of_ports_or_port_declarations_item_last_non_ansi &&) = default;
};

class Any_argument_list_item_last : public Node {
public:
  Any_argument_list_item_last(std::string element);
  Any_argument_list_item_last(Any_argument_list_item_last &&) = default;
  Any_argument_list_item_last &
  operator=(Any_argument_list_item_last &&) = default;
};

class Gate_instantiation : public Node {
public:
  Gate_instantiation(std::string element);
  Gate_instantiation(Gate_instantiation &&) = default;
  Gate_instantiation &operator=(Gate_instantiation &&) = default;
};

class Casting_type : public Node {
public:
  Casting_type(std::string element);
  Casting_type(Casting_type &&) = default;
  Casting_type &operator=(Casting_type &&) = default;
};

class Expr_mintypmax : public Node {
public:
  Expr_mintypmax(std::string element);
  Expr_mintypmax(Expr_mintypmax &&) = default;
  Expr_mintypmax &operator=(Expr_mintypmax &&) = default;
};

class Continuous_assign : public Node {
public:
  Continuous_assign(std::string element);
  Continuous_assign(Continuous_assign &&) = default;
  Continuous_assign &operator=(Continuous_assign &&) = default;
};

class Parameter_assign : public Node {
public:
  Parameter_assign(std::string element);
  Parameter_assign(Parameter_assign &&) = default;
  Parameter_assign &operator=(Parameter_assign &&) = default;
};

class Delay_value_simple : public Node {
public:
  Delay_value_simple(std::string element);
  Delay_value_simple(Delay_value_simple &&) = default;
  Delay_value_simple &operator=(Delay_value_simple &&) = default;
};

class Switchtype : public Node {
public:
  Switchtype(std::string element);
  Switchtype(Switchtype &&) = default;
  Switchtype &operator=(Switchtype &&) = default;
};

class Package_or_generate_item_declaration : public Node {
public:
  Package_or_generate_item_declaration(std::string element);
  Package_or_generate_item_declaration(
      Package_or_generate_item_declaration &&) = default;
  Package_or_generate_item_declaration &
  operator=(Package_or_generate_item_declaration &&) = default;
};

class Bin_based_number : public Node {
public:
  Bin_based_number(std::string element);
  Bin_based_number(Bin_based_number &&) = default;
  Bin_based_number &operator=(Bin_based_number &&) = default;
};

class Loop_generate_construct : public Node {
public:
  Loop_generate_construct(std::string element);
  Loop_generate_construct(Loop_generate_construct &&) = default;
  Loop_generate_construct &operator=(Loop_generate_construct &&) = default;
};

class Parameter_override : public Node {
public:
  Parameter_override(std::string element);
  Parameter_override(Parameter_override &&) = default;
  Parameter_override &operator=(Parameter_override &&) = default;
};

class Udp_primitive : public Node {
public:
  Udp_primitive(std::string element);
  Udp_primitive(Udp_primitive &&) = default;
  Udp_primitive &operator=(Udp_primitive &&) = default;
};

class Parameter_expr : public Node {
public:
  Parameter_expr(std::string element);
  Parameter_expr(Parameter_expr &&) = default;
  Parameter_expr &operator=(Parameter_expr &&) = default;
};

class Repeat_control : public Node {
public:
  Repeat_control(std::string element);
  Repeat_control(Repeat_control &&) = default;
  Repeat_control &operator=(Repeat_control &&) = default;
};

class Packed_signing_opt : public Node {
public:
  Packed_signing_opt(std::string element);
  Packed_signing_opt(Packed_signing_opt &&) = default;
  Packed_signing_opt &operator=(Packed_signing_opt &&) = default;
};

class Expression_or_null_list_opt : public Node {
public:
  Expression_or_null_list_opt(std::string element);
  Expression_or_null_list_opt(Expression_or_null_list_opt &&) = default;
  Expression_or_null_list_opt &
  operator=(Expression_or_null_list_opt &&) = default;
};

class Enum_name_list_item_last : public Node {
public:
  Enum_name_list_item_last(std::string element);
  Enum_name_list_item_last(Enum_name_list_item_last &&) = default;
  Enum_name_list_item_last &operator=(Enum_name_list_item_last &&) = default;
};

class Macro_formals_list_opt : public Node {
public:
  Macro_formals_list_opt(std::string element);
  Macro_formals_list_opt(Macro_formals_list_opt &&) = default;
  Macro_formals_list_opt &operator=(Macro_formals_list_opt &&) = default;
};

class Spec_notifier_opt : public Node {
public:
  Spec_notifier_opt(std::string element);
  Spec_notifier_opt(Spec_notifier_opt &&) = default;
  Spec_notifier_opt &operator=(Spec_notifier_opt &&) = default;
};

class Hierarchy_extension : public Node {
public:
  Hierarchy_extension(std::string element);
  Hierarchy_extension(Hierarchy_extension &&) = default;
  Hierarchy_extension &operator=(Hierarchy_extension &&) = default;
};

class Generate_item_list : public Node {
public:
  Generate_item_list(std::string element);
  Generate_item_list(Generate_item_list &&) = default;
  Generate_item_list &operator=(Generate_item_list &&) = default;
};

class Data_declaration_modifiers_opt : public Node {
public:
  Data_declaration_modifiers_opt(std::string element);
  Data_declaration_modifiers_opt(Data_declaration_modifiers_opt &&) = default;
  Data_declaration_modifiers_opt &
  operator=(Data_declaration_modifiers_opt &&) = default;
};

class Sequence_throughout_expr : public Node {
public:
  Sequence_throughout_expr(std::string element);
  Sequence_throughout_expr(Sequence_throughout_expr &&) = default;
  Sequence_throughout_expr &operator=(Sequence_throughout_expr &&) = default;
};

class Property_expr_or_assignment_list : public Node {
public:
  Property_expr_or_assignment_list(std::string element);
  Property_expr_or_assignment_list(Property_expr_or_assignment_list &&) =
      default;
  Property_expr_or_assignment_list &
  operator=(Property_expr_or_assignment_list &&) = default;
};

class Bitor_expr : public Node {
public:
  Bitor_expr(std::string element);
  Bitor_expr(Bitor_expr &&) = default;
  Bitor_expr &operator=(Bitor_expr &&) = default;
};

class Tf_port_list : public Node {
public:
  Tf_port_list(std::string element);
  Tf_port_list(Tf_port_list &&) = default;
  Tf_port_list &operator=(Tf_port_list &&) = default;
};

class Any_port_list_trailing_comma_named : public Node {
public:
  Any_port_list_trailing_comma_named(std::string element);
  Any_port_list_trailing_comma_named(Any_port_list_trailing_comma_named &&) =
      default;
  Any_port_list_trailing_comma_named &
  operator=(Any_port_list_trailing_comma_named &&) = default;
};

class Function_return_type_and_id : public Node {
public:
  Function_return_type_and_id(std::string element);
  Function_return_type_and_id(Function_return_type_and_id &&) = default;
  Function_return_type_and_id &
  operator=(Function_return_type_and_id &&) = default;
};

class Statement : public Node {
public:
  Statement(std::string element);
  Statement(Statement &&) = default;
  Statement &operator=(Statement &&) = default;
};

class Dr_strength1 : public Node {
public:
  Dr_strength1(std::string element);
  Dr_strength1(Dr_strength1 &&) = default;
  Dr_strength1 &operator=(Dr_strength1 &&) = default;
};

class Assign_modify_statement : public Node {
public:
  Assign_modify_statement(std::string element);
  Assign_modify_statement(Assign_modify_statement &&) = default;
  Assign_modify_statement &operator=(Assign_modify_statement &&) = default;
};

class Udp_port_decls : public Node {
public:
  Udp_port_decls(std::string element);
  Udp_port_decls(Udp_port_decls &&) = default;
  Udp_port_decls &operator=(Udp_port_decls &&) = default;
};

class Integer_vector_type : public Node {
public:
  Integer_vector_type(std::string element);
  Integer_vector_type(Integer_vector_type &&) = default;
  Integer_vector_type &operator=(Integer_vector_type &&) = default;
};

class Assignment_pattern : public Node {
public:
  Assignment_pattern(std::string element);
  Assignment_pattern(Assignment_pattern &&) = default;
  Assignment_pattern &operator=(Assignment_pattern &&) = default;
};

class Class_constructor : public Node {
public:
  Class_constructor(std::string element);
  Class_constructor(Class_constructor &&) = default;
  Class_constructor &operator=(Class_constructor &&) = default;
};

class Module_parameter_port : public Node {
public:
  Module_parameter_port(std::string element);
  Module_parameter_port(Module_parameter_port &&) = default;
  Module_parameter_port &operator=(Module_parameter_port &&) = default;
};

class Module_or_generate_item_declaration : public Node {
public:
  Module_or_generate_item_declaration(std::string element);
  Module_or_generate_item_declaration(Module_or_generate_item_declaration &&) =
      default;
  Module_or_generate_item_declaration &
  operator=(Module_or_generate_item_declaration &&) = default;
};

class Final_construct : public Node {
public:
  Final_construct(std::string element);
  Final_construct(Final_construct &&) = default;
  Final_construct &operator=(Final_construct &&) = default;
};

class Member_name : public Node {
public:
  Member_name(std::string element);
  Member_name(Member_name &&) = default;
  Member_name &operator=(Member_name &&) = default;
};

class Class_declaration : public Node {
public:
  Class_declaration(std::string element);
  Class_declaration(Class_declaration &&) = default;
  Class_declaration &operator=(Class_declaration &&) = default;
};

class Package_import_item : public Node {
public:
  Package_import_item(std::string element);
  Package_import_item(Package_import_item &&) = default;
  Package_import_item &operator=(Package_import_item &&) = default;
};

class Signing : public Node {
public:
  Signing(std::string element);
  Signing(Signing &&) = default;
  Signing &operator=(Signing &&) = default;
};

class Class_constructor_prototype : public Node {
public:
  Class_constructor_prototype(std::string element);
  Class_constructor_prototype(Class_constructor_prototype &&) = default;
  Class_constructor_prototype &
  operator=(Class_constructor_prototype &&) = default;
};

class Generate_case_item : public Node {
public:
  Generate_case_item(std::string element);
  Generate_case_item(Generate_case_item &&) = default;
  Generate_case_item &operator=(Generate_case_item &&) = default;
};

class Data_declaration : public Node {
public:
  Data_declaration(std::string element);
  Data_declaration(Data_declaration &&) = default;
  Data_declaration &operator=(Data_declaration &&) = default;
};

class Expression : public Node {
public:
  Expression(std::string element);
  Expression(Expression &&) = default;
  Expression &operator=(Expression &&) = default;
};

class Cont_assign : public Node {
public:
  Cont_assign(std::string element);
  Cont_assign(Cont_assign &&) = default;
  Cont_assign &operator=(Cont_assign &&) = default;
};

class Delay_or_event_control_opt : public Node {
public:
  Delay_or_event_control_opt(std::string element);
  Delay_or_event_control_opt(Delay_or_event_control_opt &&) = default;
  Delay_or_event_control_opt &
  operator=(Delay_or_event_control_opt &&) = default;
};

class Bind_directive : public Node {
public:
  Bind_directive(std::string element);
  Bind_directive(Bind_directive &&) = default;
  Bind_directive &operator=(Bind_directive &&) = default;
};

class Misc_directive : public Node {
public:
  Misc_directive(std::string element);
  Misc_directive(Misc_directive &&) = default;
  Misc_directive &operator=(Misc_directive &&) = default;
};

class Udp_initial_expr_opt : public Node {
public:
  Udp_initial_expr_opt(std::string element);
  Udp_initial_expr_opt(Udp_initial_expr_opt &&) = default;
  Udp_initial_expr_opt &operator=(Udp_initial_expr_opt &&) = default;
};

class Description : public Node {
public:
  Description(std::string element);
  Description(Description &&) = default;
  Description &operator=(Description &&) = default;
};

class Data_type_base : public Node {
public:
  Data_type_base(std::string element);
  Data_type_base(Data_type_base &&) = default;
  Data_type_base &operator=(Data_type_base &&) = default;
};

class Trailing_assign : public Node {
public:
  Trailing_assign(std::string element);
  Trailing_assign(Trailing_assign &&) = default;
  Trailing_assign &operator=(Trailing_assign &&) = default;
};

class Module_end : public Node {
public:
  Module_end(std::string element);
  Module_end(Module_end &&) = default;
  Module_end &operator=(Module_end &&) = default;
};

class Wait_statement : public Node {
public:
  Wait_statement(std::string element);
  Wait_statement(Wait_statement &&) = default;
  Wait_statement &operator=(Wait_statement &&) = default;
};

class Package_item_list : public Node {
public:
  Package_item_list(std::string element);
  Package_item_list(Package_item_list &&) = default;
  Package_item_list &operator=(Package_item_list &&) = default;
};

class Case_items : public Node {
public:
  Case_items(std::string element);
  Case_items(Case_items &&) = default;
  Case_items &operator=(Case_items &&) = default;
};

class Statement_or_null_list_opt : public Node {
public:
  Statement_or_null_list_opt(std::string element);
  Statement_or_null_list_opt(Statement_or_null_list_opt &&) = default;
  Statement_or_null_list_opt &
  operator=(Statement_or_null_list_opt &&) = default;
};

class Port_named : public Node {
public:
  Port_named(std::string element);
  Port_named(Port_named &&) = default;
  Port_named &operator=(Port_named &&) = default;
};

class Udp_output_sym : public Node {
public:
  Udp_output_sym(std::string element);
  Udp_output_sym(Udp_output_sym &&) = default;
  Udp_output_sym &operator=(Udp_output_sym &&) = default;
};

class Assignment_statement_no_expr : public Node {
public:
  Assignment_statement_no_expr(std::string element);
  Assignment_statement_no_expr(Assignment_statement_no_expr &&) = default;
  Assignment_statement_no_expr &
  operator=(Assignment_statement_no_expr &&) = default;
};

class Any_port_list_item_last_positional : public Node {
public:
  Any_port_list_item_last_positional(std::string element);
  Any_port_list_item_last_positional(Any_port_list_item_last_positional &&) =
      default;
  Any_port_list_item_last_positional &
  operator=(Any_port_list_item_last_positional &&) = default;
};

class Module_item_list_opt : public Node {
public:
  Module_item_list_opt(std::string element);
  Module_item_list_opt(Module_item_list_opt &&) = default;
  Module_item_list_opt &operator=(Module_item_list_opt &&) = default;
};

class Sequence_and_expr : public Node {
public:
  Sequence_and_expr(std::string element);
  Sequence_and_expr(Sequence_and_expr &&) = default;
  Sequence_and_expr &operator=(Sequence_and_expr &&) = default;
};

class Data_type : public Node {
public:
  Data_type(std::string element);
  Data_type(Data_type &&) = default;
  Data_type &operator=(Data_type &&) = default;
};

class Argument_list_opt : public Node {
public:
  Argument_list_opt(std::string element);
  Argument_list_opt(Argument_list_opt &&) = default;
  Argument_list_opt &operator=(Argument_list_opt &&) = default;
};

class For_step_opt : public Node {
public:
  For_step_opt(std::string element);
  For_step_opt(For_step_opt &&) = default;
  For_step_opt &operator=(For_step_opt &&) = default;
};

class Sequence_intersect_expr : public Node {
public:
  Sequence_intersect_expr(std::string element);
  Sequence_intersect_expr(Sequence_intersect_expr &&) = default;
  Sequence_intersect_expr &operator=(Sequence_intersect_expr &&) = default;
};

class Function_declaration : public Node {
public:
  Function_declaration(std::string element);
  Function_declaration(Function_declaration &&) = default;
  Function_declaration &operator=(Function_declaration &&) = default;
};

class Net_type_or_none : public Node {
public:
  Net_type_or_none(std::string element);
  Net_type_or_none(Net_type_or_none &&) = default;
  Net_type_or_none &operator=(Net_type_or_none &&) = default;
};

class Class_declaration_extends_opt : public Node {
public:
  Class_declaration_extends_opt(std::string element);
  Class_declaration_extends_opt(Class_declaration_extends_opt &&) = default;
  Class_declaration_extends_opt &
  operator=(Class_declaration_extends_opt &&) = default;
};

class Boolean_abbrev_opt : public Node {
public:
  Boolean_abbrev_opt(std::string element);
  Boolean_abbrev_opt(Boolean_abbrev_opt &&) = default;
  Boolean_abbrev_opt &operator=(Boolean_abbrev_opt &&) = default;
};

class Specify_path_identifiers : public Node {
public:
  Specify_path_identifiers(std::string element);
  Specify_path_identifiers(Specify_path_identifiers &&) = default;
  Specify_path_identifiers &operator=(Specify_path_identifiers &&) = default;
};

class Tf_port_direction : public Node {
public:
  Tf_port_direction(std::string element);
  Tf_port_direction(Tf_port_direction &&) = default;
  Tf_port_direction &operator=(Tf_port_direction &&) = default;
};

class Tk_decdigits : public Node {
public:
  Tk_decdigits(std::string element);
  Tk_decdigits(Tk_decdigits &&) = default;
  Tk_decdigits &operator=(Tk_decdigits &&) = default;
};

class End : public Node {
public:
  End(std::string element);
  End(End &&) = default;
  End &operator=(End &&) = default;
};

class Net_declaration : public Node {
public:
  Net_declaration(std::string element);
  Net_declaration(Net_declaration &&) = default;
  Net_declaration &operator=(Net_declaration &&) = default;
};

class Tk_tagged_opt : public Node {
public:
  Tk_tagged_opt(std::string element);
  Tk_tagged_opt(Tk_tagged_opt &&) = default;
  Tk_tagged_opt &operator=(Tk_tagged_opt &&) = default;
};

class Tk_xzdigits : public Node {
public:
  Tk_xzdigits(std::string element);
  Tk_xzdigits(Tk_xzdigits &&) = default;
  Tk_xzdigits &operator=(Tk_xzdigits &&) = default;
};

class Gatetype : public Node {
public:
  Gatetype(std::string element);
  Gatetype(Gatetype &&) = default;
  Gatetype &operator=(Gatetype &&) = default;
};

class Preprocess_include_argument : public Node {
public:
  Preprocess_include_argument(std::string element);
  Preprocess_include_argument(Preprocess_include_argument &&) = default;
  Preprocess_include_argument &
  operator=(Preprocess_include_argument &&) = default;
};

class Macro_formals_list : public Node {
public:
  Macro_formals_list(std::string element);
  Macro_formals_list(Macro_formals_list &&) = default;
  Macro_formals_list &operator=(Macro_formals_list &&) = default;
};

class Const_opt : public Node {
public:
  Const_opt(std::string element);
  Const_opt(Const_opt &&) = default;
  Const_opt &operator=(Const_opt &&) = default;
};

class Logand_expr : public Node {
public:
  Logand_expr(std::string element);
  Logand_expr(Logand_expr &&) = default;
  Logand_expr &operator=(Logand_expr &&) = default;
};

class Event_expression : public Node {
public:
  Event_expression(std::string element);
  Event_expression(Event_expression &&) = default;
  Event_expression &operator=(Event_expression &&) = default;
};

class Udp_entry_list : public Node {
public:
  Udp_entry_list(std::string element);
  Udp_entry_list(Udp_entry_list &&) = default;
  Udp_entry_list &operator=(Udp_entry_list &&) = default;
};

class Preprocessor_action : public Node {
public:
  Preprocessor_action(std::string element);
  Preprocessor_action(Preprocessor_action &&) = default;
  Preprocessor_action &operator=(Preprocessor_action &&) = default;
};

class Tf_port_declaration : public Node {
public:
  Tf_port_declaration(std::string element);
  Tf_port_declaration(Tf_port_declaration &&) = default;
  Tf_port_declaration &operator=(Tf_port_declaration &&) = default;
};

class Udp_init_opt : public Node {
public:
  Udp_init_opt(std::string element);
  Udp_init_opt(Udp_init_opt &&) = default;
  Udp_init_opt &operator=(Udp_init_opt &&) = default;
};

class Type_identifier_or_implicit_followed_by_id_and_dimensions_opt
    : public Node {
public:
  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
      std::string element);
  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt(
      Type_identifier_or_implicit_followed_by_id_and_dimensions_opt &&) =
      default;
  Type_identifier_or_implicit_followed_by_id_and_dimensions_opt &
  operator=(Type_identifier_or_implicit_followed_by_id_and_dimensions_opt &&) =
      default;
};

class Source_text : public Node {
public:
  Source_text(std::string element);
  Source_text(Source_text &&) = default;
  Source_text &operator=(Source_text &&) = default;
};

class Defparam_assign : public Node {
public:
  Defparam_assign(std::string element);
  Defparam_assign(Defparam_assign &&) = default;
  Defparam_assign &operator=(Defparam_assign &&) = default;
};

class Decl_dimensions : public Node {
public:
  Decl_dimensions(std::string element);
  Decl_dimensions(Decl_dimensions &&) = default;
  Decl_dimensions &operator=(Decl_dimensions &&) = default;
};

class Constant_dec_number : public Node {
public:
  Constant_dec_number(std::string element);
  Constant_dec_number(Constant_dec_number &&) = default;
  Constant_dec_number &operator=(Constant_dec_number &&) = default;
};

class Case_statement : public Node {
public:
  Case_statement(std::string element);
  Case_statement(Case_statement &&) = default;
  Case_statement &operator=(Case_statement &&) = default;
};

class Assignment_statement : public Node {
public:
  Assignment_statement(std::string element);
  Assignment_statement(Assignment_statement &&) = default;
  Assignment_statement &operator=(Assignment_statement &&) = default;
};

class Dpi_import_property_opt : public Node {
public:
  Dpi_import_property_opt(std::string element);
  Dpi_import_property_opt(Dpi_import_property_opt &&) = default;
  Dpi_import_property_opt &operator=(Dpi_import_property_opt &&) = default;
};

class Dpi_spec_string : public Node {
public:
  Dpi_spec_string(std::string element);
  Dpi_spec_string(Dpi_spec_string &&) = default;
  Dpi_spec_string &operator=(Dpi_spec_string &&) = default;
};

class Trailing_decl_assignment : public Node {
public:
  Trailing_decl_assignment(std::string element);
  Trailing_decl_assignment(Trailing_decl_assignment &&) = default;
  Trailing_decl_assignment &operator=(Trailing_decl_assignment &&) = default;
};

class Always_construct : public Node {
public:
  Always_construct(std::string element);
  Always_construct(Always_construct &&) = default;
  Always_construct &operator=(Always_construct &&) = default;
};

class Genvar_opt : public Node {
public:
  Genvar_opt(std::string element);
  Genvar_opt(Genvar_opt &&) = default;
  Genvar_opt &operator=(Genvar_opt &&) = default;
};

class Any_port_list_named : public Node {
public:
  Any_port_list_named(std::string element);
  Any_port_list_named(Any_port_list_named &&) = default;
  Any_port_list_named &operator=(Any_port_list_named &&) = default;
};

class Subroutine_call : public Node {
public:
  Subroutine_call(std::string element);
  Subroutine_call(Subroutine_call &&) = default;
  Subroutine_call &operator=(Subroutine_call &&) = default;
};

class Property_expr_or_assignment : public Node {
public:
  Property_expr_or_assignment(std::string element);
  Property_expr_or_assignment(Property_expr_or_assignment &&) = default;
  Property_expr_or_assignment &
  operator=(Property_expr_or_assignment &&) = default;
};

class Any_argument : public Node {
public:
  Any_argument(std::string element);
  Any_argument(Any_argument &&) = default;
  Any_argument &operator=(Any_argument &&) = default;
};

class Module_or_interface_declaration : public Node {
public:
  Module_or_interface_declaration(std::string element);
  Module_or_interface_declaration(Module_or_interface_declaration &&) = default;
  Module_or_interface_declaration &
  operator=(Module_or_interface_declaration &&) = default;
};

class Expression_opt : public Node {
public:
  Expression_opt(std::string element);
  Expression_opt(Expression_opt &&) = default;
  Expression_opt &operator=(Expression_opt &&) = default;
};

class Gate_instance_or_register_variable_list : public Node {
public:
  Gate_instance_or_register_variable_list(std::string element);
  Gate_instance_or_register_variable_list(
      Gate_instance_or_register_variable_list &&) = default;
  Gate_instance_or_register_variable_list &
  operator=(Gate_instance_or_register_variable_list &&) = default;
};

class Delay_or_event_control : public Node {
public:
  Delay_or_event_control(std::string element);
  Delay_or_event_control(Delay_or_event_control &&) = default;
  Delay_or_event_control &operator=(Delay_or_event_control &&) = default;
};

class Udp_input_list : public Node {
public:
  Udp_input_list(std::string element);
  Udp_input_list(Udp_input_list &&) = default;
  Udp_input_list &operator=(Udp_input_list &&) = default;
};

class Parameter_value_byname_list : public Node {
public:
  Parameter_value_byname_list(std::string element);
  Parameter_value_byname_list(Parameter_value_byname_list &&) = default;
  Parameter_value_byname_list &
  operator=(Parameter_value_byname_list &&) = default;
};

class Module_port_list_opt : public Node {
public:
  Module_port_list_opt(std::string element);
  Module_port_list_opt(Module_port_list_opt &&) = default;
  Module_port_list_opt &operator=(Module_port_list_opt &&) = default;
};

class List_of_ports_or_port_declarations_opt : public Node {
public:
  List_of_ports_or_port_declarations_opt(std::string element);
  List_of_ports_or_port_declarations_opt(
      List_of_ports_or_port_declarations_opt &&) = default;
  List_of_ports_or_port_declarations_opt &
  operator=(List_of_ports_or_port_declarations_opt &&) = default;
};

class Any_port_list_trailing_comma_positional : public Node {
public:
  Any_port_list_trailing_comma_positional(std::string element);
  Any_port_list_trailing_comma_positional(
      Any_port_list_trailing_comma_positional &&) = default;
  Any_port_list_trailing_comma_positional &
  operator=(Any_port_list_trailing_comma_positional &&) = default;
};

class Block_item_or_statement_or_null_list_opt : public Node {
public:
  Block_item_or_statement_or_null_list_opt(std::string element);
  Block_item_or_statement_or_null_list_opt(
      Block_item_or_statement_or_null_list_opt &&) = default;
  Block_item_or_statement_or_null_list_opt &
  operator=(Block_item_or_statement_or_null_list_opt &&) = default;
};

class Genvar_declaration : public Node {
public:
  Genvar_declaration(std::string element);
  Genvar_declaration(Genvar_declaration &&) = default;
  Genvar_declaration &operator=(Genvar_declaration &&) = default;
};

class Number : public Node {
public:
  Number(std::string element);
  Number(Number &&) = default;
  Number &operator=(Number &&) = default;
};

class Specify_item_list : public Node {
public:
  Specify_item_list(std::string element);
  Specify_item_list(Specify_item_list &&) = default;
  Specify_item_list &operator=(Specify_item_list &&) = default;
};

class Tk_ls_eq : public Node {
public:
  Tk_ls_eq(std::string element);
  Tk_ls_eq(Tk_ls_eq &&) = default;
  Tk_ls_eq &operator=(Tk_ls_eq &&) = default;
};

class Tf_variable_identifier : public Node {
public:
  Tf_variable_identifier(std::string element);
  Tf_variable_identifier(Tf_variable_identifier &&) = default;
  Tf_variable_identifier &operator=(Tf_variable_identifier &&) = default;
};

class Initial_construct : public Node {
public:
  Initial_construct(std::string element);
  Initial_construct(Initial_construct &&) = default;
  Initial_construct &operator=(Initial_construct &&) = default;
};

class Localparam_assign_list : public Node {
public:
  Localparam_assign_list(std::string element);
  Localparam_assign_list(Localparam_assign_list &&) = default;
  Localparam_assign_list &operator=(Localparam_assign_list &&) = default;
};

class Disable_statement : public Node {
public:
  Disable_statement(std::string element);
  Disable_statement(Disable_statement &&) = default;
  Disable_statement &operator=(Disable_statement &&) = default;
};

class List_of_module_item_identifiers : public Node {
public:
  List_of_module_item_identifiers(std::string element);
  List_of_module_item_identifiers(List_of_module_item_identifiers &&) = default;
  List_of_module_item_identifiers &
  operator=(List_of_module_item_identifiers &&) = default;
};

class Any_port_list_item_last_named : public Node {
public:
  Any_port_list_item_last_named(std::string element);
  Any_port_list_item_last_named(Any_port_list_item_last_named &&) = default;
  Any_port_list_item_last_named &
  operator=(Any_port_list_item_last_named &&) = default;
};

class Net_variable : public Node {
public:
  Net_variable(std::string element);
  Net_variable(Net_variable &&) = default;
  Net_variable &operator=(Net_variable &&) = default;
};

class Parameter_expr_list : public Node {
public:
  Parameter_expr_list(std::string element);
  Parameter_expr_list(Parameter_expr_list &&) = default;
  Parameter_expr_list &operator=(Parameter_expr_list &&) = default;
};

class Specparam_declaration : public Node {
public:
  Specparam_declaration(std::string element);
  Specparam_declaration(Specparam_declaration &&) = default;
  Specparam_declaration &operator=(Specparam_declaration &&) = default;
};

class Deferred_immediate_assertion_statement : public Node {
public:
  Deferred_immediate_assertion_statement(std::string element);
  Deferred_immediate_assertion_statement(
      Deferred_immediate_assertion_statement &&) = default;
  Deferred_immediate_assertion_statement &
  operator=(Deferred_immediate_assertion_statement &&) = default;
};

class Slice_size_opt : public Node {
public:
  Slice_size_opt(std::string element);
  Slice_size_opt(Slice_size_opt &&) = default;
  Slice_size_opt &operator=(Slice_size_opt &&) = default;
};

class Concurrent_assertion_item : public Node {
public:
  Concurrent_assertion_item(std::string element);
  Concurrent_assertion_item(Concurrent_assertion_item &&) = default;
  Concurrent_assertion_item &operator=(Concurrent_assertion_item &&) = default;
};

class Clocking_item_list_opt : public Node {
public:
  Clocking_item_list_opt(std::string element);
  Clocking_item_list_opt(Clocking_item_list_opt &&) = default;
  Clocking_item_list_opt &operator=(Clocking_item_list_opt &&) = default;
};

class Cycle_delay : public Node {
public:
  Cycle_delay(std::string element);
  Cycle_delay(Cycle_delay &&) = default;
  Cycle_delay &operator=(Cycle_delay &&) = default;
};

class Macroiditem : public Node {
public:
  Macroiditem(std::string element);
  Macroiditem(Macroiditem &&) = default;
  Macroiditem &operator=(Macroiditem &&) = default;
};

class Assume_property_statement : public Node {
public:
  Assume_property_statement(std::string element);
  Assume_property_statement(Assume_property_statement &&) = default;
  Assume_property_statement &operator=(Assume_property_statement &&) = default;
};

class Pull01 : public Node {
public:
  Pull01(std::string element);
  Pull01(Pull01 &&) = default;
  Pull01 &operator=(Pull01 &&) = default;
};

class Preprocessor_directive : public Node {
public:
  Preprocessor_directive(std::string element);
  Preprocessor_directive(Preprocessor_directive &&) = default;
  Preprocessor_directive &operator=(Preprocessor_directive &&) = default;
};

class Module_item_directive : public Node {
public:
  Module_item_directive(std::string element);
  Module_item_directive(Module_item_directive &&) = default;
  Module_item_directive &operator=(Module_item_directive &&) = default;
};

class Assert_property_statement : public Node {
public:
  Assert_property_statement(std::string element);
  Assert_property_statement(Assert_property_statement &&) = default;
  Assert_property_statement &operator=(Assert_property_statement &&) = default;
};

class Scope_or_if_res : public Node {
public:
  Scope_or_if_res(std::string element);
  Scope_or_if_res(Scope_or_if_res &&) = default;
  Scope_or_if_res &operator=(Scope_or_if_res &&) = default;
};

class Task_prototype : public Node {
public:
  Task_prototype(std::string element);
  Task_prototype(Task_prototype &&) = default;
  Task_prototype &operator=(Task_prototype &&) = default;
};

class Clocking_declaration : public Node {
public:
  Clocking_declaration(std::string element);
  Clocking_declaration(Clocking_declaration &&) = default;
  Clocking_declaration &operator=(Clocking_declaration &&) = default;
};

class Block_identifier_opt : public Node {
public:
  Block_identifier_opt(std::string element);
  Block_identifier_opt(Block_identifier_opt &&) = default;
  Block_identifier_opt &operator=(Block_identifier_opt &&) = default;
};

class Macroidentifier : public Node {
public:
  Macroidentifier(std::string element);
  Macroidentifier(Macroidentifier &&) = default;
  Macroidentifier &operator=(Macroidentifier &&) = default;
};

class Property_spec_disable_iff_opt : public Node {
public:
  Property_spec_disable_iff_opt(std::string element);
  Property_spec_disable_iff_opt(Property_spec_disable_iff_opt &&) = default;
  Property_spec_disable_iff_opt &
  operator=(Property_spec_disable_iff_opt &&) = default;
};

class Macrogenericitem : public Node {
public:
  Macrogenericitem(std::string element);
  Macrogenericitem(Macrogenericitem &&) = default;
  Macrogenericitem &operator=(Macrogenericitem &&) = default;
};

class Module_block : public Node {
public:
  Module_block(std::string element);
  Module_block(Module_block &&) = default;
  Module_block &operator=(Module_block &&) = default;
};

class Stream_expression : public Node {
public:
  Stream_expression(std::string element);
  Stream_expression(Stream_expression &&) = default;
  Stream_expression &operator=(Stream_expression &&) = default;
};

class Final_or_zero : public Node {
public:
  Final_or_zero(std::string element);
  Final_or_zero(Final_or_zero &&) = default;
  Final_or_zero &operator=(Final_or_zero &&) = default;
};

class Tk_edge_descriptor : public Node {
public:
  Tk_edge_descriptor(std::string element);
  Tk_edge_descriptor(Tk_edge_descriptor &&) = default;
  Tk_edge_descriptor &operator=(Tk_edge_descriptor &&) = default;
};

class Method_property_qualifier_list_not_starting_with_virtual : public Node {
public:
  Method_property_qualifier_list_not_starting_with_virtual(std::string element);
  Method_property_qualifier_list_not_starting_with_virtual(
      Method_property_qualifier_list_not_starting_with_virtual &&) = default;
  Method_property_qualifier_list_not_starting_with_virtual &operator=(
      Method_property_qualifier_list_not_starting_with_virtual &&) = default;
};

class Identifier_opt : public Node {
public:
  Identifier_opt(std::string element);
  Identifier_opt(Identifier_opt &&) = default;
  Identifier_opt &operator=(Identifier_opt &&) = default;
};

class Module_parameter_port_list_preprocessor_last : public Node {
public:
  Module_parameter_port_list_preprocessor_last(std::string element);
  Module_parameter_port_list_preprocessor_last(
      Module_parameter_port_list_preprocessor_last &&) = default;
  Module_parameter_port_list_preprocessor_last &
  operator=(Module_parameter_port_list_preprocessor_last &&) = default;
};

class Type_assignment : public Node {
public:
  Type_assignment(std::string element);
  Type_assignment(Type_assignment &&) = default;
  Type_assignment &operator=(Type_assignment &&) = default;
};

class Type_assignment_list : public Node {
public:
  Type_assignment_list(std::string element);
  Type_assignment_list(Type_assignment_list &&) = default;
  Type_assignment_list &operator=(Type_assignment_list &&) = default;
};

class Method_qualifier_list_opt : public Node {
public:
  Method_qualifier_list_opt(std::string element);
  Method_qualifier_list_opt(Method_qualifier_list_opt &&) = default;
  Method_qualifier_list_opt &operator=(Method_qualifier_list_opt &&) = default;
};

class Stream_operator : public Node {
public:
  Stream_operator(std::string element);
  Stream_operator(Stream_operator &&) = default;
  Stream_operator &operator=(Stream_operator &&) = default;
};

class Assertion_item : public Node {
public:
  Assertion_item(std::string element);
  Assertion_item(Assertion_item &&) = default;
  Assertion_item &operator=(Assertion_item &&) = default;
};

class Property_spec : public Node {
public:
  Property_spec(std::string element);
  Property_spec(Property_spec &&) = default;
  Property_spec &operator=(Property_spec &&) = default;
};

class Streaming_concatenation : public Node {
public:
  Streaming_concatenation(std::string element);
  Streaming_concatenation(Streaming_concatenation &&) = default;
  Streaming_concatenation &operator=(Streaming_concatenation &&) = default;
};

class Edge_descriptor_list : public Node {
public:
  Edge_descriptor_list(std::string element);
  Edge_descriptor_list(Edge_descriptor_list &&) = default;
  Edge_descriptor_list &operator=(Edge_descriptor_list &&) = default;
};

class Property_qualifier : public Node {
public:
  Property_qualifier(std::string element);
  Property_qualifier(Property_qualifier &&) = default;
  Property_qualifier &operator=(Property_qualifier &&) = default;
};

class Event_control_opt : public Node {
public:
  Event_control_opt(std::string element);
  Event_control_opt(Event_control_opt &&) = default;
  Event_control_opt &operator=(Event_control_opt &&) = default;
};

class Class_item_qualifier : public Node {
public:
  Class_item_qualifier(std::string element);
  Class_item_qualifier(Class_item_qualifier &&) = default;
  Class_item_qualifier &operator=(Class_item_qualifier &&) = default;
};

class Concurrent_assertion_statement : public Node {
public:
  Concurrent_assertion_statement(std::string element);
  Concurrent_assertion_statement(Concurrent_assertion_statement &&) = default;
  Concurrent_assertion_statement &
  operator=(Concurrent_assertion_statement &&) = default;
};

class Cover_property_statement : public Node {
public:
  Cover_property_statement(std::string element);
  Cover_property_statement(Cover_property_statement &&) = default;
  Cover_property_statement &operator=(Cover_property_statement &&) = default;
};

class Stream_expression_list : public Node {
public:
  Stream_expression_list(std::string element);
  Stream_expression_list(Stream_expression_list &&) = default;
  Stream_expression_list &operator=(Stream_expression_list &&) = default;
};

class Class_item_qualifier_list_opt : public Node {
public:
  Class_item_qualifier_list_opt(std::string element);
  Class_item_qualifier_list_opt(Class_item_qualifier_list_opt &&) = default;
  Class_item_qualifier_list_opt &
  operator=(Class_item_qualifier_list_opt &&) = default;
};

class Assertion_item_declaration : public Node {
public:
  Assertion_item_declaration(std::string element);
  Assertion_item_declaration(Assertion_item_declaration &&) = default;
  Assertion_item_declaration &
  operator=(Assertion_item_declaration &&) = default;
};

class Boolean_abbrev : public Node {
public:
  Boolean_abbrev(std::string element);
  Boolean_abbrev(Boolean_abbrev &&) = default;
  Boolean_abbrev &operator=(Boolean_abbrev &&) = default;
};

class Cycle_delay_range : public Node {
public:
  Cycle_delay_range(std::string element);
  Cycle_delay_range(Cycle_delay_range &&) = default;
  Cycle_delay_range &operator=(Cycle_delay_range &&) = default;
};

class Property_operator : public Node {
public:
  Property_operator(std::string element);
  Property_operator(Property_operator &&) = default;
  Property_operator &operator=(Property_operator &&) = default;
};

class Property_spec_disable_iff : public Node {
public:
  Property_spec_disable_iff(std::string element);
  Property_spec_disable_iff(Property_spec_disable_iff &&) = default;
  Property_spec_disable_iff &operator=(Property_spec_disable_iff &&) = default;
};

class Config_declaration : public Node {
public:
  Config_declaration(std::string element);
  Config_declaration(Config_declaration &&) = default;
  Config_declaration &operator=(Config_declaration &&) = default;
};

class With_constraint_block_opt : public Node {
public:
  With_constraint_block_opt(std::string element);
  With_constraint_block_opt(With_constraint_block_opt &&) = default;
  With_constraint_block_opt &operator=(With_constraint_block_opt &&) = default;
};

class Random_qualifier : public Node {
public:
  Random_qualifier(std::string element);
  Random_qualifier(Random_qualifier &&) = default;
  Random_qualifier &operator=(Random_qualifier &&) = default;
};

class Bind_target_instance_list : public Node {
public:
  Bind_target_instance_list(std::string element);
  Bind_target_instance_list(Bind_target_instance_list &&) = default;
  Bind_target_instance_list &operator=(Bind_target_instance_list &&) = default;
};

class Hierarchy_or_call_extension : public Node {
public:
  Hierarchy_or_call_extension(std::string element);
  Hierarchy_or_call_extension(Hierarchy_or_call_extension &&) = default;
  Hierarchy_or_call_extension &
  operator=(Hierarchy_or_call_extension &&) = default;
};

class Clocking_item_list : public Node {
public:
  Clocking_item_list(std::string element);
  Clocking_item_list(Clocking_item_list &&) = default;
  Clocking_item_list &operator=(Clocking_item_list &&) = default;
};

class Modport_declaration : public Node {
public:
  Modport_declaration(std::string element);
  Modport_declaration(Modport_declaration &&) = default;
  Modport_declaration &operator=(Modport_declaration &&) = default;
};

class Class_constraint : public Node {
public:
  Class_constraint(std::string element);
  Class_constraint(Class_constraint &&) = default;
  Class_constraint &operator=(Class_constraint &&) = default;
};

class Net_alias : public Node {
public:
  Net_alias(std::string element);
  Net_alias(Net_alias &&) = default;
  Net_alias &operator=(Net_alias &&) = default;
};

class Type_reference : public Node {
public:
  Type_reference(std::string element);
  Type_reference(Type_reference &&) = default;
  Type_reference &operator=(Type_reference &&) = default;
};

class Method_qualifier_list : public Node {
public:
  Method_qualifier_list(std::string element);
  Method_qualifier_list(Method_qualifier_list &&) = default;
  Method_qualifier_list &operator=(Method_qualifier_list &&) = default;
};

class Interface_type : public Node {
public:
  Interface_type(std::string element);
  Interface_type(Interface_type &&) = default;
  Interface_type &operator=(Interface_type &&) = default;
};

class Package_export_declaration : public Node {
public:
  Package_export_declaration(std::string element);
  Package_export_declaration(Package_export_declaration &&) = default;
  Package_export_declaration &
  operator=(Package_export_declaration &&) = default;
};

class Constraint_block_item_list_opt : public Node {
public:
  Constraint_block_item_list_opt(std::string element);
  Constraint_block_item_list_opt(Constraint_block_item_list_opt &&) = default;
  Constraint_block_item_list_opt &
  operator=(Constraint_block_item_list_opt &&) = default;
};

class Constraint_block_item_list : public Node {
public:
  Constraint_block_item_list(std::string element);
  Constraint_block_item_list(Constraint_block_item_list &&) = default;
  Constraint_block_item_list &
  operator=(Constraint_block_item_list &&) = default;
};

class List_of_libraries_opt : public Node {
public:
  List_of_libraries_opt(std::string element);
  List_of_libraries_opt(List_of_libraries_opt &&) = default;
  List_of_libraries_opt &operator=(List_of_libraries_opt &&) = default;
};

class Lib_cell_id : public Node {
public:
  Lib_cell_id(std::string element);
  Lib_cell_id(Lib_cell_id &&) = default;
  Lib_cell_id &operator=(Lib_cell_id &&) = default;
};

class Expect_property_statement : public Node {
public:
  Expect_property_statement(std::string element);
  Expect_property_statement(Expect_property_statement &&) = default;
  Expect_property_statement &operator=(Expect_property_statement &&) = default;
};

class Optional_semicolon : public Node {
public:
  Optional_semicolon(std::string element);
  Optional_semicolon(Optional_semicolon &&) = default;
  Optional_semicolon &operator=(Optional_semicolon &&) = default;
};

class Identifier_list_in_parens_opt : public Node {
public:
  Identifier_list_in_parens_opt(std::string element);
  Identifier_list_in_parens_opt(Identifier_list_in_parens_opt &&) = default;
  Identifier_list_in_parens_opt &
  operator=(Identifier_list_in_parens_opt &&) = default;
};

class Sequence_port_list_in_parens_opt : public Node {
public:
  Sequence_port_list_in_parens_opt(std::string element);
  Sequence_port_list_in_parens_opt(Sequence_port_list_in_parens_opt &&) =
      default;
  Sequence_port_list_in_parens_opt &
  operator=(Sequence_port_list_in_parens_opt &&) = default;
};

class Data_type_or_implicit_basic_followed_by_id : public Node {
public:
  Data_type_or_implicit_basic_followed_by_id(std::string element);
  Data_type_or_implicit_basic_followed_by_id(
      Data_type_or_implicit_basic_followed_by_id &&) = default;
  Data_type_or_implicit_basic_followed_by_id &
  operator=(Data_type_or_implicit_basic_followed_by_id &&) = default;
};

class Modport_simple_ports_declaration_last : public Node {
public:
  Modport_simple_ports_declaration_last(std::string element);
  Modport_simple_ports_declaration_last(
      Modport_simple_ports_declaration_last &&) = default;
  Modport_simple_ports_declaration_last &
  operator=(Modport_simple_ports_declaration_last &&) = default;
};

class Goto_repetition : public Node {
public:
  Goto_repetition(std::string element);
  Goto_repetition(Goto_repetition &&) = default;
  Goto_repetition &operator=(Goto_repetition &&) = default;
};

class Modport_ports_list : public Node {
public:
  Modport_ports_list(std::string element);
  Modport_ports_list(Modport_ports_list &&) = default;
  Modport_ports_list &operator=(Modport_ports_list &&) = default;
};

class Coverage_spec_or_option_list : public Node {
public:
  Coverage_spec_or_option_list(std::string element);
  Coverage_spec_or_option_list(Coverage_spec_or_option_list &&) = default;
  Coverage_spec_or_option_list &
  operator=(Coverage_spec_or_option_list &&) = default;
};

class Assertion_variable_declaration : public Node {
public:
  Assertion_variable_declaration(std::string element);
  Assertion_variable_declaration(Assertion_variable_declaration &&) = default;
  Assertion_variable_declaration &
  operator=(Assertion_variable_declaration &&) = default;
};

class Interface_opt : public Node {
public:
  Interface_opt(std::string element);
  Interface_opt(Interface_opt &&) = default;
  Interface_opt &operator=(Interface_opt &&) = default;
};

class List_of_libraries : public Node {
public:
  List_of_libraries(std::string element);
  List_of_libraries(List_of_libraries &&) = default;
  List_of_libraries &operator=(List_of_libraries &&) = default;
};

class Type_identifier_or_implicit_basic_followed_by_id : public Node {
public:
  Type_identifier_or_implicit_basic_followed_by_id(std::string element);
  Type_identifier_or_implicit_basic_followed_by_id(
      Type_identifier_or_implicit_basic_followed_by_id &&) = default;
  Type_identifier_or_implicit_basic_followed_by_id &
  operator=(Type_identifier_or_implicit_basic_followed_by_id &&) = default;
};

class Bind_target_instance : public Node {
public:
  Bind_target_instance(std::string element);
  Bind_target_instance(Bind_target_instance &&) = default;
  Bind_target_instance &operator=(Bind_target_instance &&) = default;
};

class Property_actual_arg_opt : public Node {
public:
  Property_actual_arg_opt(std::string element);
  Property_actual_arg_opt(Property_actual_arg_opt &&) = default;
  Property_actual_arg_opt &operator=(Property_actual_arg_opt &&) = default;
};

class Method_qualifier : public Node {
public:
  Method_qualifier(std::string element);
  Method_qualifier(Method_qualifier &&) = default;
  Method_qualifier &operator=(Method_qualifier &&) = default;
};

class Design_statement : public Node {
public:
  Design_statement(std::string element);
  Design_statement(Design_statement &&) = default;
  Design_statement &operator=(Design_statement &&) = default;
};

class Modport_simple_ports_declaration_begin : public Node {
public:
  Modport_simple_ports_declaration_begin(std::string element);
  Modport_simple_ports_declaration_begin(
      Modport_simple_ports_declaration_begin &&) = default;
  Modport_simple_ports_declaration_begin &
  operator=(Modport_simple_ports_declaration_begin &&) = default;
};

class Sequence_port_list_opt : public Node {
public:
  Sequence_port_list_opt(std::string element);
  Sequence_port_list_opt(Sequence_port_list_opt &&) = default;
  Sequence_port_list_opt &operator=(Sequence_port_list_opt &&) = default;
};

class Clocking_item : public Node {
public:
  Clocking_item(std::string element);
  Clocking_item(Clocking_item &&) = default;
  Clocking_item &operator=(Clocking_item &&) = default;
};

class Constraint_declaration : public Node {
public:
  Constraint_declaration(std::string element);
  Constraint_declaration(Constraint_declaration &&) = default;
  Constraint_declaration &operator=(Constraint_declaration &&) = default;
};

class Clocking_direction : public Node {
public:
  Clocking_direction(std::string element);
  Clocking_direction(Clocking_direction &&) = default;
  Clocking_direction &operator=(Clocking_direction &&) = default;
};

class Modport_item : public Node {
public:
  Modport_item(std::string element);
  Modport_item(Modport_item &&) = default;
  Modport_item &operator=(Modport_item &&) = default;
};

class Clocking_decl_assign : public Node {
public:
  Clocking_decl_assign(std::string element);
  Clocking_decl_assign(Clocking_decl_assign &&) = default;
  Clocking_decl_assign &operator=(Clocking_decl_assign &&) = default;
};

class Consecutive_repetition : public Node {
public:
  Consecutive_repetition(std::string element);
  Consecutive_repetition(Consecutive_repetition &&) = default;
  Consecutive_repetition &operator=(Consecutive_repetition &&) = default;
};

class Bins_or_options_list_opt : public Node {
public:
  Bins_or_options_list_opt(std::string element);
  Bins_or_options_list_opt(Bins_or_options_list_opt &&) = default;
  Bins_or_options_list_opt &operator=(Bins_or_options_list_opt &&) = default;
};

class Cycle_range : public Node {
public:
  Cycle_range(std::string element);
  Cycle_range(Cycle_range &&) = default;
  Cycle_range &operator=(Cycle_range &&) = default;
};

class Clocking_skew_opt : public Node {
public:
  Clocking_skew_opt(std::string element);
  Clocking_skew_opt(Clocking_skew_opt &&) = default;
  Clocking_skew_opt &operator=(Clocking_skew_opt &&) = default;
};

class Nonconsecutive_repetition : public Node {
public:
  Nonconsecutive_repetition(std::string element);
  Nonconsecutive_repetition(Nonconsecutive_repetition &&) = default;
  Nonconsecutive_repetition &operator=(Nonconsecutive_repetition &&) = default;
};

class Constraint_expression_no_preprocessor : public Node {
public:
  Constraint_expression_no_preprocessor(std::string element);
  Constraint_expression_no_preprocessor(
      Constraint_expression_no_preprocessor &&) = default;
  Constraint_expression_no_preprocessor &
  operator=(Constraint_expression_no_preprocessor &&) = default;
};

class List_of_clocking_decl_assign : public Node {
public:
  List_of_clocking_decl_assign(std::string element);
  List_of_clocking_decl_assign(List_of_clocking_decl_assign &&) = default;
  List_of_clocking_decl_assign &
  operator=(List_of_clocking_decl_assign &&) = default;
};

class Property_port_list : public Node {
public:
  Property_port_list(std::string element);
  Property_port_list(Property_port_list &&) = default;
  Property_port_list &operator=(Property_port_list &&) = default;
};

class Net_alias_assign_lvalue_list : public Node {
public:
  Net_alias_assign_lvalue_list(std::string element);
  Net_alias_assign_lvalue_list(Net_alias_assign_lvalue_list &&) = default;
  Net_alias_assign_lvalue_list &
  operator=(Net_alias_assign_lvalue_list &&) = default;
};

class Assertion_variable_declaration_list : public Node {
public:
  Assertion_variable_declaration_list(std::string element);
  Assertion_variable_declaration_list(Assertion_variable_declaration_list &&) =
      default;
  Assertion_variable_declaration_list &
  operator=(Assertion_variable_declaration_list &&) = default;
};

class List_of_config_rule_statements : public Node {
public:
  List_of_config_rule_statements(std::string element);
  List_of_config_rule_statements(List_of_config_rule_statements &&) = default;
  List_of_config_rule_statements &
  operator=(List_of_config_rule_statements &&) = default;
};

class Constraint_block : public Node {
public:
  Constraint_block(std::string element);
  Constraint_block(Constraint_block &&) = default;
  Constraint_block &operator=(Constraint_block &&) = default;
};

class List_of_config_rule_statements_opt : public Node {
public:
  List_of_config_rule_statements_opt(std::string element);
  List_of_config_rule_statements_opt(List_of_config_rule_statements_opt &&) =
      default;
  List_of_config_rule_statements_opt &
  operator=(List_of_config_rule_statements_opt &&) = default;
};

class Property_port_modifiers_opt : public Node {
public:
  Property_port_modifiers_opt(std::string element);
  Property_port_modifiers_opt(Property_port_modifiers_opt &&) = default;
  Property_port_modifiers_opt &
  operator=(Property_port_modifiers_opt &&) = default;
};

class With_constraint_block : public Node {
public:
  With_constraint_block(std::string element);
  With_constraint_block(With_constraint_block &&) = default;
  With_constraint_block &operator=(With_constraint_block &&) = default;
};

class Property_declaration : public Node {
public:
  Property_declaration(std::string element);
  Property_declaration(Property_declaration &&) = default;
  Property_declaration &operator=(Property_declaration &&) = default;
};

class Implication_operator : public Node {
public:
  Implication_operator(std::string element);
  Implication_operator(Implication_operator &&) = default;
  Implication_operator &operator=(Implication_operator &&) = default;
};

class Cover_point : public Node {
public:
  Cover_point(std::string element);
  Cover_point(Cover_point &&) = default;
  Cover_point &operator=(Cover_point &&) = default;
};

class Coverage_event : public Node {
public:
  Coverage_event(std::string element);
  Coverage_event(Coverage_event &&) = default;
  Coverage_event &operator=(Coverage_event &&) = default;
};

class Property_formal_type_followed_by_id : public Node {
public:
  Property_formal_type_followed_by_id(std::string element);
  Property_formal_type_followed_by_id(Property_formal_type_followed_by_id &&) =
      default;
  Property_formal_type_followed_by_id &
  operator=(Property_formal_type_followed_by_id &&) = default;
};

class Config_rule_statement : public Node {
public:
  Config_rule_statement(std::string element);
  Config_rule_statement(Config_rule_statement &&) = default;
  Config_rule_statement &operator=(Config_rule_statement &&) = default;
};

class Modport_item_list : public Node {
public:
  Modport_item_list(std::string element);
  Modport_item_list(Modport_item_list &&) = default;
  Modport_item_list &operator=(Modport_item_list &&) = default;
};

class Property_port_item : public Node {
public:
  Property_port_item(std::string element);
  Property_port_item(Property_port_item &&) = default;
  Property_port_item &operator=(Property_port_item &&) = default;
};

class Liblist_clause : public Node {
public:
  Liblist_clause(std::string element);
  Liblist_clause(Liblist_clause &&) = default;
  Liblist_clause &operator=(Liblist_clause &&) = default;
};

class Lib_cell_identifiers_opt : public Node {
public:
  Lib_cell_identifiers_opt(std::string element);
  Lib_cell_identifiers_opt(Lib_cell_identifiers_opt &&) = default;
  Lib_cell_identifiers_opt &operator=(Lib_cell_identifiers_opt &&) = default;
};

class Covergroup_declaration : public Node {
public:
  Covergroup_declaration(std::string element);
  Covergroup_declaration(Covergroup_declaration &&) = default;
  Covergroup_declaration &operator=(Covergroup_declaration &&) = default;
};

class Modport_simple_port : public Node {
public:
  Modport_simple_port(std::string element);
  Modport_simple_port(Modport_simple_port &&) = default;
  Modport_simple_port &operator=(Modport_simple_port &&) = default;
};

class Sequence_declaration : public Node {
public:
  Sequence_declaration(std::string element);
  Sequence_declaration(Sequence_declaration &&) = default;
  Sequence_declaration &operator=(Sequence_declaration &&) = default;
};

class Coverage_event_opt : public Node {
public:
  Coverage_event_opt(std::string element);
  Coverage_event_opt(Coverage_event_opt &&) = default;
  Coverage_event_opt &operator=(Coverage_event_opt &&) = default;
};

class Lib_cell_identifiers : public Node {
public:
  Lib_cell_identifiers(std::string element);
  Lib_cell_identifiers(Lib_cell_identifiers &&) = default;
  Lib_cell_identifiers &operator=(Lib_cell_identifiers &&) = default;
};

class Cycle_range_or_expr : public Node {
public:
  Cycle_range_or_expr(std::string element);
  Cycle_range_or_expr(Cycle_range_or_expr &&) = default;
  Cycle_range_or_expr &operator=(Cycle_range_or_expr &&) = default;
};

class Property_port_list_in_parens_opt : public Node {
public:
  Property_port_list_in_parens_opt(std::string element);
  Property_port_list_in_parens_opt(Property_port_list_in_parens_opt &&) =
      default;
  Property_port_list_in_parens_opt &
  operator=(Property_port_list_in_parens_opt &&) = default;
};

class Coverage_spec_or_option_list_opt : public Node {
public:
  Coverage_spec_or_option_list_opt(std::string element);
  Coverage_spec_or_option_list_opt(Coverage_spec_or_option_list_opt &&) =
      default;
  Coverage_spec_or_option_list_opt &
  operator=(Coverage_spec_or_option_list_opt &&) = default;
};

class Coverage_spec_or_option : public Node {
public:
  Coverage_spec_or_option(std::string element);
  Coverage_spec_or_option(Coverage_spec_or_option &&) = default;
  Coverage_spec_or_option &operator=(Coverage_spec_or_option &&) = default;
};

class Coverage_spec : public Node {
public:
  Coverage_spec(std::string element);
  Coverage_spec(Coverage_spec &&) = default;
  Coverage_spec &operator=(Coverage_spec &&) = default;
};

class Constraint_block_item : public Node {
public:
  Constraint_block_item(std::string element);
  Constraint_block_item(Constraint_block_item &&) = default;
  Constraint_block_item &operator=(Constraint_block_item &&) = default;
};

class Tk_static_opt : public Node {
public:
  Tk_static_opt(std::string element);
  Tk_static_opt(Tk_static_opt &&) = default;
  Tk_static_opt &operator=(Tk_static_opt &&) = default;
};

class Until_operator : public Node {
public:
  Until_operator(std::string element);
  Until_operator(Until_operator &&) = default;
  Until_operator &operator=(Until_operator &&) = default;
};
class Cover_sequence_statement : public Node {
public:
  Cover_sequence_statement(std::string element);
  Cover_sequence_statement(Cover_sequence_statement &&) = default;
  Cover_sequence_statement &operator=(Cover_sequence_statement &&) = default;
};
class With_covergroup_expression_in_parens : public Node {
public:
  With_covergroup_expression_in_parens(std::string element);
  With_covergroup_expression_in_parens(
      With_covergroup_expression_in_parens &&) = default;
  With_covergroup_expression_in_parens &
  operator=(With_covergroup_expression_in_parens &&) = default;
};
class Declaration_extends_list_opt : public Node {
public:
  Declaration_extends_list_opt(std::string element);
  Declaration_extends_list_opt(Declaration_extends_list_opt &&) = default;
  Declaration_extends_list_opt &
  operator=(Declaration_extends_list_opt &&) = default;
};
class Rs_if_else : public Node {
public:
  Rs_if_else(std::string element);
  Rs_if_else(Rs_if_else &&) = default;
  Rs_if_else &operator=(Rs_if_else &&) = default;
};
class Followed_by_operator : public Node {
public:
  Followed_by_operator(std::string element);
  Followed_by_operator(Followed_by_operator &&) = default;
  Followed_by_operator &operator=(Followed_by_operator &&) = default;
};
class Local_sequence_lvar_port_direction_opt : public Node {
public:
  Local_sequence_lvar_port_direction_opt(std::string element);
  Local_sequence_lvar_port_direction_opt(
      Local_sequence_lvar_port_direction_opt &&) = default;
  Local_sequence_lvar_port_direction_opt &
  operator=(Local_sequence_lvar_port_direction_opt &&) = default;
};
class Bins_expression : public Node {
public:
  Bins_expression(std::string element);
  Bins_expression(Bins_expression &&) = default;
  Bins_expression &operator=(Bins_expression &&) = default;
};
class Property_actual_arg : public Node {
public:
  Property_actual_arg(std::string element);
  Property_actual_arg(Property_actual_arg &&) = default;
  Property_actual_arg &operator=(Property_actual_arg &&) = default;
};
class Select_expression : public Node {
public:
  Select_expression(std::string element);
  Select_expression(Select_expression &&) = default;
  Select_expression &operator=(Select_expression &&) = default;
};
class Slice_size : public Node {
public:
  Slice_size(std::string element);
  Slice_size(Slice_size &&) = default;
  Slice_size &operator=(Slice_size &&) = default;
};
class Property_case_item : public Node {
public:
  Property_case_item(std::string element);
  Property_case_item(Property_case_item &&) = default;
  Property_case_item &operator=(Property_case_item &&) = default;
};
class Default_skew : public Node {
public:
  Default_skew(std::string element);
  Default_skew(Default_skew &&) = default;
  Default_skew &operator=(Default_skew &&) = default;
};
class Constraint_expression_list : public Node {
public:
  Constraint_expression_list(std::string element);
  Constraint_expression_list(Constraint_expression_list &&) = default;
  Constraint_expression_list &
  operator=(Constraint_expression_list &&) = default;
};
class Modport_clocking_declaration_begin : public Node {
public:
  Modport_clocking_declaration_begin(std::string element);
  Modport_clocking_declaration_begin(Modport_clocking_declaration_begin &&) =
      default;
  Modport_clocking_declaration_begin &
  operator=(Modport_clocking_declaration_begin &&) = default;
};
class Property_case_item_list : public Node {
public:
  Property_case_item_list(std::string element);
  Property_case_item_list(Property_case_item_list &&) = default;
  Property_case_item_list &operator=(Property_case_item_list &&) = default;
};
class Randomize_call : public Node {
public:
  Randomize_call(std::string element);
  Randomize_call(Randomize_call &&) = default;
  Randomize_call &operator=(Randomize_call &&) = default;
};
class Cross_item_list : public Node {
public:
  Cross_item_list(std::string element);
  Cross_item_list(Cross_item_list &&) = default;
  Cross_item_list &operator=(Cross_item_list &&) = default;
};
class Production_item : public Node {
public:
  Production_item(std::string element);
  Production_item(Production_item &&) = default;
  Production_item &operator=(Production_item &&) = default;
};
class Data_type_or_void_with_id : public Node {
public:
  Data_type_or_void_with_id(std::string element);
  Data_type_or_void_with_id(Data_type_or_void_with_id &&) = default;
  Data_type_or_void_with_id &operator=(Data_type_or_void_with_id &&) = default;
};
class Lb_star_rb : public Node {
public:
  Lb_star_rb(std::string element);
  Lb_star_rb(Lb_star_rb &&) = default;
  Lb_star_rb &operator=(Lb_star_rb &&) = default;
};
class Modport_clocking_declaration_last : public Node {
public:
  Modport_clocking_declaration_last(std::string element);
  Modport_clocking_declaration_last(Modport_clocking_declaration_last &&) =
      default;
  Modport_clocking_declaration_last &
  operator=(Modport_clocking_declaration_last &&) = default;
};
class Uniqueness_constraint : public Node {
public:
  Uniqueness_constraint(std::string element);
  Uniqueness_constraint(Uniqueness_constraint &&) = default;
  Uniqueness_constraint &operator=(Uniqueness_constraint &&) = default;
};
class Any_port_list_preprocessor_last_named : public Node {
public:
  Any_port_list_preprocessor_last_named(std::string element);
  Any_port_list_preprocessor_last_named(
      Any_port_list_preprocessor_last_named &&) = default;
  Any_port_list_preprocessor_last_named &
  operator=(Any_port_list_preprocessor_last_named &&) = default;
};
class Modport_tf_ports_declaration_trailing_comma : public Node {
public:
  Modport_tf_ports_declaration_trailing_comma(std::string element);
  Modport_tf_ports_declaration_trailing_comma(
      Modport_tf_ports_declaration_trailing_comma &&) = default;
  Modport_tf_ports_declaration_trailing_comma &
  operator=(Modport_tf_ports_declaration_trailing_comma &&) = default;
};
class Interface_data_declaration : public Node {
public:
  Interface_data_declaration(std::string element);
  Interface_data_declaration(Interface_data_declaration &&) = default;
  Interface_data_declaration &
  operator=(Interface_data_declaration &&) = default;
};
class Method_property_qualifier : public Node {
public:
  Method_property_qualifier(std::string element);
  Method_property_qualifier(Method_property_qualifier &&) = default;
  Method_property_qualifier &operator=(Method_property_qualifier &&) = default;
};
class Bins_or_options_list : public Node {
public:
  Bins_or_options_list(std::string element);
  Bins_or_options_list(Bins_or_options_list &&) = default;
  Bins_or_options_list &operator=(Bins_or_options_list &&) = default;
};
class Opt_config : public Node {
public:
  Opt_config(std::string element);
  Opt_config(Opt_config &&) = default;
  Opt_config &operator=(Opt_config &&) = default;
};
class Pattern_list : public Node {
public:
  Pattern_list(std::string element);
  Pattern_list(Pattern_list &&) = default;
  Pattern_list &operator=(Pattern_list &&) = default;
};
class Bins_or_options : public Node {
public:
  Bins_or_options(std::string element);
  Bins_or_options(Bins_or_options &&) = default;
  Bins_or_options &operator=(Bins_or_options &&) = default;
};
class Pattern_opt : public Node {
public:
  Pattern_opt(std::string element);
  Pattern_opt(Pattern_opt &&) = default;
  Pattern_opt &operator=(Pattern_opt &&) = default;
};
class Interface_class_item_list : public Node {
public:
  Interface_class_item_list(std::string element);
  Interface_class_item_list(Interface_class_item_list &&) = default;
  Interface_class_item_list &operator=(Interface_class_item_list &&) = default;
};
class Cross_body_item_list : public Node {
public:
  Cross_body_item_list(std::string element);
  Cross_body_item_list(Cross_body_item_list &&) = default;
  Cross_body_item_list &operator=(Cross_body_item_list &&) = default;
};
class Modport_tf_ports_declaration_begin : public Node {
public:
  Modport_tf_ports_declaration_begin(std::string element);
  Modport_tf_ports_declaration_begin(Modport_tf_ports_declaration_begin &&) =
      default;
  Modport_tf_ports_declaration_begin &
  operator=(Modport_tf_ports_declaration_begin &&) = default;
};
class Rs_rule_list : public Node {
public:
  Rs_rule_list(std::string element);
  Rs_rule_list(Rs_rule_list &&) = default;
  Rs_rule_list &operator=(Rs_rule_list &&) = default;
};
class Cell_clause : public Node {
public:
  Cell_clause(std::string element);
  Cell_clause(Cell_clause &&) = default;
  Cell_clause &operator=(Cell_clause &&) = default;
};
class Sequence_port_list : public Node {
public:
  Sequence_port_list(std::string element);
  Sequence_port_list(Sequence_port_list &&) = default;
  Sequence_port_list &operator=(Sequence_port_list &&) = default;
};
class Let_port_list : public Node {
public:
  Let_port_list(std::string element);
  Let_port_list(Let_port_list &&) = default;
  Let_port_list &operator=(Let_port_list &&) = default;
};
class Production_list : public Node {
public:
  Production_list(std::string element);
  Production_list(Production_list &&) = default;
  Production_list &operator=(Production_list &&) = default;
};
class Rs_production_list_or_rand_join : public Node {
public:
  Rs_production_list_or_rand_join(std::string element);
  Rs_production_list_or_rand_join(Rs_production_list_or_rand_join &&) = default;
  Rs_production_list_or_rand_join &
  operator=(Rs_production_list_or_rand_join &&) = default;
};
class Rs_code_block : public Node {
public:
  Rs_code_block(std::string element);
  Rs_code_block(Rs_code_block &&) = default;
  Rs_code_block &operator=(Rs_code_block &&) = default;
};
class Let_declaration : public Node {
public:
  Let_declaration(std::string element);
  Let_declaration(Let_declaration &&) = default;
  Let_declaration &operator=(Let_declaration &&) = default;
};
class Expression_in_parens_opt : public Node {
public:
  Expression_in_parens_opt(std::string element);
  Expression_in_parens_opt(Expression_in_parens_opt &&) = default;
  Expression_in_parens_opt &operator=(Expression_in_parens_opt &&) = default;
};
class Array_method_with_predicate_opt : public Node {
public:
  Array_method_with_predicate_opt(std::string element);
  Array_method_with_predicate_opt(Array_method_with_predicate_opt &&) = default;
  Array_method_with_predicate_opt &
  operator=(Array_method_with_predicate_opt &&) = default;
};
class Cross_item : public Node {
public:
  Cross_item(std::string element);
  Cross_item(Cross_item &&) = default;
  Cross_item &operator=(Cross_item &&) = default;
};
class Modport_tf_ports_declaration_last : public Node {
public:
  Modport_tf_ports_declaration_last(std::string element);
  Modport_tf_ports_declaration_last(Modport_tf_ports_declaration_last &&) =
      default;
  Modport_tf_ports_declaration_last &
  operator=(Modport_tf_ports_declaration_last &&) = default;
};
class Case_pattern_item : public Node {
public:
  Case_pattern_item(std::string element);
  Case_pattern_item(Case_pattern_item &&) = default;
  Case_pattern_item &operator=(Case_pattern_item &&) = default;
};
class Inst_clause : public Node {
public:
  Inst_clause(std::string element);
  Inst_clause(Inst_clause &&) = default;
  Inst_clause &operator=(Inst_clause &&) = default;
};
class Rs_repeat : public Node {
public:
  Rs_repeat(std::string element);
  Rs_repeat(Rs_repeat &&) = default;
  Rs_repeat &operator=(Rs_repeat &&) = default;
};
class Covergroup_expression_bracketed_opt : public Node {
public:
  Covergroup_expression_bracketed_opt(std::string element);
  Covergroup_expression_bracketed_opt(Covergroup_expression_bracketed_opt &&) =
      default;
  Covergroup_expression_bracketed_opt &
  operator=(Covergroup_expression_bracketed_opt &&) = default;
};
class Clocking_drive_only : public Node {
public:
  Clocking_drive_only(std::string element);
  Clocking_drive_only(Clocking_drive_only &&) = default;
  Clocking_drive_only &operator=(Clocking_drive_only &&) = default;
};
class Constraint_primary : public Node {
public:
  Constraint_primary(std::string element);
  Constraint_primary(Constraint_primary &&) = default;
  Constraint_primary &operator=(Constraint_primary &&) = default;
};
class Constraint_expression : public Node {
public:
  Constraint_expression(std::string element);
  Constraint_expression(Constraint_expression &&) = default;
  Constraint_expression &operator=(Constraint_expression &&) = default;
};
class Tk_evalstringliteral : public Node {
public:
  Tk_evalstringliteral(std::string element);
  Tk_evalstringliteral(Tk_evalstringliteral &&) = default;
  Tk_evalstringliteral &operator=(Tk_evalstringliteral &&) = default;
};
class Sequence_match_item_list : public Node {
public:
  Sequence_match_item_list(std::string element);
  Sequence_match_item_list(Sequence_match_item_list &&) = default;
  Sequence_match_item_list &operator=(Sequence_match_item_list &&) = default;
};
class Sequence_spec : public Node {
public:
  Sequence_spec(std::string element);
  Sequence_spec(Sequence_spec &&) = default;
  Sequence_spec &operator=(Sequence_spec &&) = default;
};
class Cover_cross : public Node {
public:
  Cover_cross(std::string element);
  Cover_cross(Cover_cross &&) = default;
  Cover_cross &operator=(Cover_cross &&) = default;
};
class Wildcard_opt : public Node {
public:
  Wildcard_opt(std::string element);
  Wildcard_opt(Wildcard_opt &&) = default;
  Wildcard_opt &operator=(Wildcard_opt &&) = default;
};
class Case_inside_items : public Node {
public:
  Case_inside_items(std::string element);
  Case_inside_items(Case_inside_items &&) = default;
  Case_inside_items &operator=(Case_inside_items &&) = default;
};
class Modport_tf_port : public Node {
public:
  Modport_tf_port(std::string element);
  Modport_tf_port(Modport_tf_port &&) = default;
  Modport_tf_port &operator=(Modport_tf_port &&) = default;
};
class Weight_specification : public Node {
public:
  Weight_specification(std::string element);
  Weight_specification(Weight_specification &&) = default;
  Weight_specification &operator=(Weight_specification &&) = default;
};
class Select_condition : public Node {
public:
  Select_condition(std::string element);
  Select_condition(Select_condition &&) = default;
  Select_condition &operator=(Select_condition &&) = default;
};
class Deferred_immediate_assertion_item : public Node {
public:
  Deferred_immediate_assertion_item(std::string element);
  Deferred_immediate_assertion_item(Deferred_immediate_assertion_item &&) =
      default;
  Deferred_immediate_assertion_item &
  operator=(Deferred_immediate_assertion_item &&) = default;
};
class Let_formal_type_followed_by_id : public Node {
public:
  Let_formal_type_followed_by_id(std::string element);
  Let_formal_type_followed_by_id(Let_formal_type_followed_by_id &&) = default;
  Let_formal_type_followed_by_id &
  operator=(Let_formal_type_followed_by_id &&) = default;
};
class Coverage_bin_rhs : public Node {
public:
  Coverage_bin_rhs(std::string element);
  Coverage_bin_rhs(Coverage_bin_rhs &&) = default;
  Coverage_bin_rhs &operator=(Coverage_bin_rhs &&) = default;
};
class Production_items_list : public Node {
public:
  Production_items_list(std::string element);
  Production_items_list(Production_items_list &&) = default;
  Production_items_list &operator=(Production_items_list &&) = default;
};
class Preprocessor_balanced_port_declarations : public Node {
public:
  Preprocessor_balanced_port_declarations(std::string element);
  Preprocessor_balanced_port_declarations(
      Preprocessor_balanced_port_declarations &&) = default;
  Preprocessor_balanced_port_declarations &
  operator=(Preprocessor_balanced_port_declarations &&) = default;
};
class Simple_type : public Node {
public:
  Simple_type(std::string element);
  Simple_type(Simple_type &&) = default;
  Simple_type &operator=(Simple_type &&) = default;
};
class Rs_production_list : public Node {
public:
  Rs_production_list(std::string element);
  Rs_production_list(Rs_production_list &&) = default;
  Rs_production_list &operator=(Rs_production_list &&) = default;
};
class Dpi_export_item : public Node {
public:
  Dpi_export_item(std::string element);
  Dpi_export_item(Dpi_export_item &&) = default;
  Dpi_export_item &operator=(Dpi_export_item &&) = default;
};
class Production : public Node {
public:
  Production(std::string element);
  Production(Production &&) = default;
  Production &operator=(Production &&) = default;
};
class Modport_clocking_declaration_trailing_comma : public Node {
public:
  Modport_clocking_declaration_trailing_comma(std::string element);
  Modport_clocking_declaration_trailing_comma(
      Modport_clocking_declaration_trailing_comma &&) = default;
  Modport_clocking_declaration_trailing_comma &
  operator=(Modport_clocking_declaration_trailing_comma &&) = default;
};
class Let_port_list_in_parens_opt : public Node {
public:
  Let_port_list_in_parens_opt(std::string element);
  Let_port_list_in_parens_opt(Let_port_list_in_parens_opt &&) = default;
  Let_port_list_in_parens_opt &
  operator=(Let_port_list_in_parens_opt &&) = default;
};
class Cross_body : public Node {
public:
  Cross_body(std::string element);
  Cross_body(Cross_body &&) = default;
  Cross_body &operator=(Cross_body &&) = default;
};
class Use_clause : public Node {
public:
  Use_clause(std::string element);
  Use_clause(Use_clause &&) = default;
  Use_clause &operator=(Use_clause &&) = default;
};
class Sequence_match_item : public Node {
public:
  Sequence_match_item(std::string element);
  Sequence_match_item(Sequence_match_item &&) = default;
  Sequence_match_item &operator=(Sequence_match_item &&) = default;
};
class Coverage_bin : public Node {
public:
  Coverage_bin(std::string element);
  Coverage_bin(Coverage_bin &&) = default;
  Coverage_bin &operator=(Coverage_bin &&) = default;
};
class Sequence_port_type_followed_by_id : public Node {
public:
  Sequence_port_type_followed_by_id(std::string element);
  Sequence_port_type_followed_by_id(Sequence_port_type_followed_by_id &&) =
      default;
  Sequence_port_type_followed_by_id &
  operator=(Sequence_port_type_followed_by_id &&) = default;
};
class Interface_class_declaration : public Node {
public:
  Interface_class_declaration(std::string element);
  Interface_class_declaration(Interface_class_declaration &&) = default;
  Interface_class_declaration &
  operator=(Interface_class_declaration &&) = default;
};
class Identifier_list : public Node {
public:
  Identifier_list(std::string element);
  Identifier_list(Identifier_list &&) = default;
  Identifier_list &operator=(Identifier_list &&) = default;
};
class Sequence_port_item : public Node {
public:
  Sequence_port_item(std::string element);
  Sequence_port_item(Sequence_port_item &&) = default;
  Sequence_port_item &operator=(Sequence_port_item &&) = default;
};
class Dist_item : public Node {
public:
  Dist_item(std::string element);
  Dist_item(Dist_item &&) = default;
  Dist_item &operator=(Dist_item &&) = default;
};
class Dist_weight : public Node {
public:
  Dist_weight(std::string element);
  Dist_weight(Dist_weight &&) = default;
  Dist_weight &operator=(Dist_weight &&) = default;
};
class Bins_keyword : public Node {
public:
  Bins_keyword(std::string element);
  Bins_keyword(Bins_keyword &&) = default;
  Bins_keyword &operator=(Bins_keyword &&) = default;
};
class List_of_ports_or_port_declarations_preprocessor_last_ansi : public Node {
public:
  List_of_ports_or_port_declarations_preprocessor_last_ansi(
      std::string element);
  List_of_ports_or_port_declarations_preprocessor_last_ansi(
      List_of_ports_or_port_declarations_preprocessor_last_ansi &&) = default;
  List_of_ports_or_port_declarations_preprocessor_last_ansi &operator=(
      List_of_ports_or_port_declarations_preprocessor_last_ansi &&) = default;
};
class Implements_interface_list : public Node {
public:
  Implements_interface_list(std::string element);
  Implements_interface_list(Implements_interface_list &&) = default;
  Implements_interface_list &operator=(Implements_interface_list &&) = default;
};
class Let_port_item : public Node {
public:
  Let_port_item(std::string element);
  Let_port_item(Let_port_item &&) = default;
  Let_port_item &operator=(Let_port_item &&) = default;
};
class Array_method_with_predicate : public Node {
public:
  Array_method_with_predicate(std::string element);
  Array_method_with_predicate(Array_method_with_predicate &&) = default;
  Array_method_with_predicate &
  operator=(Array_method_with_predicate &&) = default;
};
class Coverage_option : public Node {
public:
  Coverage_option(std::string element);
  Coverage_option(Coverage_option &&) = default;
  Coverage_option &operator=(Coverage_option &&) = default;
};
class Constraint_set : public Node {
public:
  Constraint_set(std::string element);
  Constraint_set(Constraint_set &&) = default;
  Constraint_set &operator=(Constraint_set &&) = default;
};
class Pattern : public Node {
public:
  Pattern(std::string element);
  Pattern(Pattern &&) = default;
  Pattern &operator=(Pattern &&) = default;
};
class Net_type_declaration : public Node {
public:
  Net_type_declaration(std::string element);
  Net_type_declaration(Net_type_declaration &&) = default;
  Net_type_declaration &operator=(Net_type_declaration &&) = default;
};
class Bins_selection : public Node {
public:
  Bins_selection(std::string element);
  Bins_selection(Bins_selection &&) = default;
  Bins_selection &operator=(Bins_selection &&) = default;
};
class Expression_or_dist_list : public Node {
public:
  Expression_or_dist_list(std::string element);
  Expression_or_dist_list(Expression_or_dist_list &&) = default;
  Expression_or_dist_list &operator=(Expression_or_dist_list &&) = default;
};
class Clocking_skew : public Node {
public:
  Clocking_skew(std::string element);
  Clocking_skew(Clocking_skew &&) = default;
  Clocking_skew &operator=(Clocking_skew &&) = default;
};
class Interface_class_item : public Node {
public:
  Interface_class_item(std::string element);
  Interface_class_item(Interface_class_item &&) = default;
  Interface_class_item &operator=(Interface_class_item &&) = default;
};
class Sequence_expr_match_item_list : public Node {
public:
  Sequence_expr_match_item_list(std::string element);
  Sequence_expr_match_item_list(Sequence_expr_match_item_list &&) = default;
  Sequence_expr_match_item_list &
  operator=(Sequence_expr_match_item_list &&) = default;
};
class Tk_anglebracketinclude : public Node {
public:
  Tk_anglebracketinclude(std::string element);
  Tk_anglebracketinclude(Tk_anglebracketinclude &&) = default;
  Tk_anglebracketinclude &operator=(Tk_anglebracketinclude &&) = default;
};
class Interface_class_item_list_opt : public Node {
public:
  Interface_class_item_list_opt(std::string element);
  Interface_class_item_list_opt(Interface_class_item_list_opt &&) = default;
  Interface_class_item_list_opt &
  operator=(Interface_class_item_list_opt &&) = default;
};
class Import_export : public Node {
public:
  Import_export(std::string element);
  Import_export(Import_export &&) = default;
  Import_export &operator=(Import_export &&) = default;
};
class With_covergroup_expression : public Node {
public:
  With_covergroup_expression(std::string element);
  With_covergroup_expression(With_covergroup_expression &&) = default;
  With_covergroup_expression &
  operator=(With_covergroup_expression &&) = default;
};
class Constraint_primary_list : public Node {
public:
  Constraint_primary_list(std::string element);
  Constraint_primary_list(Constraint_primary_list &&) = default;
  Constraint_primary_list &operator=(Constraint_primary_list &&) = default;
};
class Property_case_statement : public Node {
public:
  Property_case_statement(std::string element);
  Property_case_statement(Property_case_statement &&) = default;
  Property_case_statement &operator=(Property_case_statement &&) = default;
};
class Charge_strength : public Node {
public:
  Charge_strength(std::string element);
  Charge_strength(Charge_strength &&) = default;
  Charge_strength &operator=(Charge_strength &&) = default;
};
class Dpi_import_property : public Node {
public:
  Dpi_import_property(std::string element);
  Dpi_import_property(Dpi_import_property &&) = default;
  Dpi_import_property &operator=(Dpi_import_property &&) = default;
};
class Iff_expr_opt : public Node {
public:
  Iff_expr_opt(std::string element);
  Iff_expr_opt(Iff_expr_opt &&) = default;
  Iff_expr_opt &operator=(Iff_expr_opt &&) = default;
};
class Rs_rule : public Node {
public:
  Rs_rule(std::string element);
  Rs_rule(Rs_rule &&) = default;
  Rs_rule &operator=(Rs_rule &&) = default;
};
class Interface_class_method : public Node {
public:
  Interface_class_method(std::string element);
  Interface_class_method(Interface_class_method &&) = default;
  Interface_class_method &operator=(Interface_class_method &&) = default;
};
class Modport_simple_ports_declaration_trailing_comma : public Node {
public:
  Modport_simple_ports_declaration_trailing_comma(std::string element);
  Modport_simple_ports_declaration_trailing_comma(
      Modport_simple_ports_declaration_trailing_comma &&) = default;
  Modport_simple_ports_declaration_trailing_comma &
  operator=(Modport_simple_ports_declaration_trailing_comma &&) = default;
};
class Case_inside_item : public Node {
public:
  Case_inside_item(std::string element);
  Case_inside_item(Case_inside_item &&) = default;
  Case_inside_item &operator=(Case_inside_item &&) = default;
};
class Restrict_property_statement : public Node {
public:
  Restrict_property_statement(std::string element);
  Restrict_property_statement(Restrict_property_statement &&) = default;
  Restrict_property_statement &
  operator=(Restrict_property_statement &&) = default;
};
class Dist_list : public Node {
public:
  Dist_list(std::string element);
  Dist_list(Dist_list &&) = default;
  Dist_list &operator=(Dist_list &&) = default;
};
class Rs_prod : public Node {
public:
  Rs_prod(std::string element);
  Rs_prod(Rs_prod &&) = default;
  Rs_prod &operator=(Rs_prod &&) = default;
};
class Array_ordering_method : public Node {
public:
  Array_ordering_method(std::string element);
  Array_ordering_method(Array_ordering_method &&) = default;
  Array_ordering_method &operator=(Array_ordering_method &&) = default;
};
class Randsequence_statement : public Node {
public:
  Randsequence_statement(std::string element);
  Randsequence_statement(Randsequence_statement &&) = default;
  Randsequence_statement &operator=(Randsequence_statement &&) = default;
};
class Cross_body_item : public Node {
public:
  Cross_body_item(std::string element);
  Cross_body_item(Cross_body_item &&) = default;
  Cross_body_item &operator=(Cross_body_item &&) = default;
};
class Case_pattern_items : public Node {
public:
  Case_pattern_items(std::string element);
  Case_pattern_items(Case_pattern_items &&) = default;
  Case_pattern_items &operator=(Case_pattern_items &&) = default;
};
class Cross_body_item_list_opt : public Node {
public:
  Cross_body_item_list_opt(std::string element);
  Cross_body_item_list_opt(Cross_body_item_list_opt &&) = default;
  Cross_body_item_list_opt &operator=(Cross_body_item_list_opt &&) = default;
};
class Modport_ports_declaration_trailing_comma : public Node {
public:
  Modport_ports_declaration_trailing_comma(std::string element);
  Modport_ports_declaration_trailing_comma(
      Modport_ports_declaration_trailing_comma &&) = default;
  Modport_ports_declaration_trailing_comma &
  operator=(Modport_ports_declaration_trailing_comma &&) = default;
};
class Set_covergroup_expression_or_covergroup_range_list_or_trans_list
    : public Node {
public:
  Set_covergroup_expression_or_covergroup_range_list_or_trans_list(
      std::string element);
  Set_covergroup_expression_or_covergroup_range_list_or_trans_list(
      Set_covergroup_expression_or_covergroup_range_list_or_trans_list &&) =
      default;
  Set_covergroup_expression_or_covergroup_range_list_or_trans_list &operator=(
      Set_covergroup_expression_or_covergroup_range_list_or_trans_list &&) =
      default;
};

class Tk_strong : public Node {
public:
  Tk_strong(std::string element);
  Tk_strong(Tk_strong &&) = default;
  Tk_strong &operator=(Tk_strong &&) = default;
};
class Preprocessor_else_class_item : public Node {
public:
  Preprocessor_else_class_item(std::string element);
  Preprocessor_else_class_item(Preprocessor_else_class_item &&) = default;
  Preprocessor_else_class_item &
  operator=(Preprocessor_else_class_item &&) = default;
};
class Tk_genvar : public Node {
public:
  Tk_genvar(std::string element);
  Tk_genvar(Tk_genvar &&) = default;
  Tk_genvar &operator=(Tk_genvar &&) = default;
};
class File_path_spec_list : public Node {
public:
  File_path_spec_list(std::string element);
  File_path_spec_list(File_path_spec_list &&) = default;
  File_path_spec_list &operator=(File_path_spec_list &&) = default;
};
class Preprocessor_elsif_description_item : public Node {
public:
  Preprocessor_elsif_description_item(std::string element);
  Preprocessor_elsif_description_item(Preprocessor_elsif_description_item &&) =
      default;
  Preprocessor_elsif_description_item &
  operator=(Preprocessor_elsif_description_item &&) = default;
};
class Branch_probe_expression : public Node {
public:
  Branch_probe_expression(std::string element);
  Branch_probe_expression(Branch_probe_expression &&) = default;
  Branch_probe_expression &operator=(Branch_probe_expression &&) = default;
};
class Tk_rcmos : public Node {
public:
  Tk_rcmos(std::string element);
  Tk_rcmos(Tk_rcmos &&) = default;
  Tk_rcmos &operator=(Tk_rcmos &&) = default;
};
class Tk_pipearrow2 : public Node {
public:
  Tk_pipearrow2(std::string element);
  Tk_pipearrow2(Tk_pipearrow2 &&) = default;
  Tk_pipearrow2 &operator=(Tk_pipearrow2 &&) = default;
};
class Tk_ssetup : public Node {
public:
  Tk_ssetup(std::string element);
  Tk_ssetup(Tk_ssetup &&) = default;
  Tk_ssetup &operator=(Tk_ssetup &&) = default;
};
class Preprocessor_elsif_generate_items : public Node {
public:
  Preprocessor_elsif_generate_items(std::string element);
  Preprocessor_elsif_generate_items(Preprocessor_elsif_generate_items &&) =
      default;
  Preprocessor_elsif_generate_items &
  operator=(Preprocessor_elsif_generate_items &&) = default;
};
class Tk_sskew : public Node {
public:
  Tk_sskew(std::string element);
  Tk_sskew(Tk_sskew &&) = default;
  Tk_sskew &operator=(Tk_sskew &&) = default;
};
class Tk_new : public Node {
public:
  Tk_new(std::string element);
  Tk_new(Tk_new &&) = default;
  Tk_new &operator=(Tk_new &&) = default;
};
class Library_source : public Node {
public:
  Library_source(std::string element);
  Library_source(Library_source &&) = default;
  Library_source &operator=(Library_source &&) = default;
};
class Tk_localparam : public Node {
public:
  Tk_localparam(std::string element);
  Tk_localparam(Tk_localparam &&) = default;
  Tk_localparam &operator=(Tk_localparam &&) = default;
};
class Preprocessor_elsif_port_declarations_opt : public Node {
public:
  Preprocessor_elsif_port_declarations_opt(std::string element);
  Preprocessor_elsif_port_declarations_opt(
      Preprocessor_elsif_port_declarations_opt &&) = default;
  Preprocessor_elsif_port_declarations_opt &
  operator=(Preprocessor_elsif_port_declarations_opt &&) = default;
};
class Tk_union : public Node {
public:
  Tk_union(std::string element);
  Tk_union(Tk_union &&) = default;
  Tk_union &operator=(Tk_union &&) = default;
};
class Tk_showcancelled : public Node {
public:
  Tk_showcancelled(std::string element);
  Tk_showcancelled(Tk_showcancelled &&) = default;
  Tk_showcancelled &operator=(Tk_showcancelled &&) = default;
};
class Tk_wand : public Node {
public:
  Tk_wand(std::string element);
  Tk_wand(Tk_wand &&) = default;
  Tk_wand &operator=(Tk_wand &&) = default;
};
class Dr_begin_keywords : public Node {
public:
  Dr_begin_keywords(std::string element);
  Dr_begin_keywords(Dr_begin_keywords &&) = default;
  Dr_begin_keywords &operator=(Dr_begin_keywords &&) = default;
};
class Member_pattern_list : public Node {
public:
  Member_pattern_list(std::string element);
  Member_pattern_list(Member_pattern_list &&) = default;
  Member_pattern_list &operator=(Member_pattern_list &&) = default;
};
class Tk_strong0 : public Node {
public:
  Tk_strong0(std::string element);
  Tk_strong0(Tk_strong0 &&) = default;
  Tk_strong0 &operator=(Tk_strong0 &&) = default;
};
class Analog_construct : public Node {
public:
  Analog_construct(std::string element);
  Analog_construct(Analog_construct &&) = default;
  Analog_construct &operator=(Analog_construct &&) = default;
};
class Tk_wreal : public Node {
public:
  Tk_wreal(std::string element);
  Tk_wreal(Tk_wreal &&) = default;
  Tk_wreal &operator=(Tk_wreal &&) = default;
};
class Tk_rand : public Node {
public:
  Tk_rand(std::string element);
  Tk_rand(Tk_rand &&) = default;
  Tk_rand &operator=(Tk_rand &&) = default;
};
class Tk_poundpound : public Node {
public:
  Tk_poundpound(std::string element);
  Tk_poundpound(Tk_poundpound &&) = default;
  Tk_poundpound &operator=(Tk_poundpound &&) = default;
};
class Nature_items : public Node {
public:
  Nature_items(std::string element);
  Nature_items(Nature_items &&) = default;
  Nature_items &operator=(Nature_items &&) = default;
};
class Dr_suppress_faults : public Node {
public:
  Dr_suppress_faults(std::string element);
  Dr_suppress_faults(Dr_suppress_faults &&) = default;
  Dr_suppress_faults &operator=(Dr_suppress_faults &&) = default;
};
class Tk_repeat : public Node {
public:
  Tk_repeat(std::string element);
  Tk_repeat(Tk_repeat &&) = default;
  Tk_repeat &operator=(Tk_repeat &&) = default;
};
class Tk_time : public Node {
public:
  Tk_time(std::string element);
  Tk_time(Tk_time &&) = default;
  Tk_time &operator=(Tk_time &&) = default;
};
class Dr_resetall : public Node {
public:
  Dr_resetall(std::string element);
  Dr_resetall(Dr_resetall &&) = default;
  Dr_resetall &operator=(Dr_resetall &&) = default;
};
class Tk_clocking : public Node {
public:
  Tk_clocking(std::string element);
  Tk_clocking(Tk_clocking &&) = default;
  Tk_clocking &operator=(Tk_clocking &&) = default;
};
class Tk_parameter : public Node {
public:
  Tk_parameter(std::string element);
  Tk_parameter(Tk_parameter &&) = default;
  Tk_parameter &operator=(Tk_parameter &&) = default;
};
class Tk_initial : public Node {
public:
  Tk_initial(std::string element);
  Tk_initial(Tk_initial &&) = default;
  Tk_initial &operator=(Tk_initial &&) = default;
};
class Tk_pulsestyle_ondetect : public Node {
public:
  Tk_pulsestyle_ondetect(std::string element);
  Tk_pulsestyle_ondetect(Tk_pulsestyle_ondetect &&) = default;
  Tk_pulsestyle_ondetect &operator=(Tk_pulsestyle_ondetect &&) = default;
};
class Discipline_items : public Node {
public:
  Discipline_items(std::string element);
  Discipline_items(Discipline_items &&) = default;
  Discipline_items &operator=(Discipline_items &&) = default;
};
class Tk_global : public Node {
public:
  Tk_global(std::string element);
  Tk_global(Tk_global &&) = default;
  Tk_global &operator=(Tk_global &&) = default;
};
class Dr_end_keywords : public Node {
public:
  Dr_end_keywords(std::string element);
  Dr_end_keywords(Dr_end_keywords &&) = default;
  Dr_end_keywords &operator=(Dr_end_keywords &&) = default;
};
class Tk_sample : public Node {
public:
  Tk_sample(std::string element);
  Tk_sample(Tk_sample &&) = default;
  Tk_sample &operator=(Tk_sample &&) = default;
};
class Tk_unique_index : public Node {
public:
  Tk_unique_index(std::string element);
  Tk_unique_index(Tk_unique_index &&) = default;
  Tk_unique_index &operator=(Tk_unique_index &&) = default;
};
class Tk_cmos : public Node {
public:
  Tk_cmos(std::string element);
  Tk_cmos(Tk_cmos &&) = default;
  Tk_cmos &operator=(Tk_cmos &&) = default;
};
class Tk_pstar : public Node {
public:
  Tk_pstar(std::string element);
  Tk_pstar(Tk_pstar &&) = default;
  Tk_pstar &operator=(Tk_pstar &&) = default;
};
class Tk_extern : public Node {
public:
  Tk_extern(std::string element);
  Tk_extern(Tk_extern &&) = default;
  Tk_extern &operator=(Tk_extern &&) = default;
};
class Module_attribute_foreign : public Node {
public:
  Module_attribute_foreign(std::string element);
  Module_attribute_foreign(Module_attribute_foreign &&) = default;
  Module_attribute_foreign &operator=(Module_attribute_foreign &&) = default;
};
class Tk_constraint : public Node {
public:
  Tk_constraint(std::string element);
  Tk_constraint(Tk_constraint &&) = default;
  Tk_constraint &operator=(Tk_constraint &&) = default;
};
class Tk_solve : public Node {
public:
  Tk_solve(std::string element);
  Tk_solve(Tk_solve &&) = default;
  Tk_solve &operator=(Tk_solve &&) = default;
};
class Tk_triand : public Node {
public:
  Tk_triand(std::string element);
  Tk_triand(Tk_triand &&) = default;
  Tk_triand &operator=(Tk_triand &&) = default;
};
class Tk_join_none : public Node {
public:
  Tk_join_none(std::string element);
  Tk_join_none(Tk_join_none &&) = default;
  Tk_join_none &operator=(Tk_join_none &&) = default;
};
class Tk_static : public Node {
public:
  Tk_static(std::string element);
  Tk_static(Tk_static &&) = default;
  Tk_static &operator=(Tk_static &&) = default;
};
class Pp_define : public Node {
public:
  Pp_define(std::string element);
  Pp_define(Pp_define &&) = default;
  Pp_define &operator=(Pp_define &&) = default;
};
class Discipline_declaration : public Node {
public:
  Discipline_declaration(std::string element);
  Discipline_declaration(Discipline_declaration &&) = default;
  Discipline_declaration &operator=(Discipline_declaration &&) = default;
};
class Tk_disable : public Node {
public:
  Tk_disable(std::string element);
  Tk_disable(Tk_disable &&) = default;
  Tk_disable &operator=(Tk_disable &&) = default;
};
class Tk_reverse : public Node {
public:
  Tk_reverse(std::string element);
  Tk_reverse(Tk_reverse &&) = default;
  Tk_reverse &operator=(Tk_reverse &&) = default;
};
class Tk_shortreal : public Node {
public:
  Tk_shortreal(std::string element);
  Tk_shortreal(Tk_shortreal &&) = default;
  Tk_shortreal &operator=(Tk_shortreal &&) = default;
};
class Tk_find_last_index : public Node {
public:
  Tk_find_last_index(std::string element);
  Tk_find_last_index(Tk_find_last_index &&) = default;
  Tk_find_last_index &operator=(Tk_find_last_index &&) = default;
};
class Tk_expect : public Node {
public:
  Tk_expect(std::string element);
  Tk_expect(Tk_expect &&) = default;
  Tk_expect &operator=(Tk_expect &&) = default;
};
class Analog_statement : public Node {
public:
  Analog_statement(std::string element);
  Analog_statement(Analog_statement &&) = default;
  Analog_statement &operator=(Analog_statement &&) = default;
};
class Udp_unknown_list : public Node {
public:
  Udp_unknown_list(std::string element);
  Udp_unknown_list(Udp_unknown_list &&) = default;
  Udp_unknown_list &operator=(Udp_unknown_list &&) = default;
};
class Tk_lbstarrb : public Node {
public:
  Tk_lbstarrb(std::string element);
  Tk_lbstarrb(Tk_lbstarrb &&) = default;
  Tk_lbstarrb &operator=(Tk_lbstarrb &&) = default;
};
class Preprocessor_elsif_module_items : public Node {
public:
  Preprocessor_elsif_module_items(std::string element);
  Preprocessor_elsif_module_items(Preprocessor_elsif_module_items &&) = default;
  Preprocessor_elsif_module_items &
  operator=(Preprocessor_elsif_module_items &&) = default;
};
class Rs_case : public Node {
public:
  Rs_case(std::string element);
  Rs_case(Rs_case &&) = default;
  Rs_case &operator=(Rs_case &&) = default;
};
class Preprocessor_balanced_class_items : public Node {
public:
  Preprocessor_balanced_class_items(std::string element);
  Preprocessor_balanced_class_items(Preprocessor_balanced_class_items &&) =
      default;
  Preprocessor_balanced_class_items &
  operator=(Preprocessor_balanced_class_items &&) = default;
};
class Named_parameter_assignment_list : public Node {
public:
  Named_parameter_assignment_list(std::string element);
  Named_parameter_assignment_list(Named_parameter_assignment_list &&) = default;
  Named_parameter_assignment_list &
  operator=(Named_parameter_assignment_list &&) = default;
};
class Rs_case_item_list : public Node {
public:
  Rs_case_item_list(std::string element);
  Rs_case_item_list(Rs_case_item_list &&) = default;
  Rs_case_item_list &operator=(Rs_case_item_list &&) = default;
};
class Dr_pragma : public Node {
public:
  Dr_pragma(std::string element);
  Dr_pragma(Dr_pragma &&) = default;
  Dr_pragma &operator=(Dr_pragma &&) = default;
};
class Tk_discrete : public Node {
public:
  Tk_discrete(std::string element);
  Tk_discrete(Tk_discrete &&) = default;
  Tk_discrete &operator=(Tk_discrete &&) = default;
};
class Tk_flow : public Node {
public:
  Tk_flow(std::string element);
  Tk_flow(Tk_flow &&) = default;
  Tk_flow &operator=(Tk_flow &&) = default;
};
class Tk_ref : public Node {
public:
  Tk_ref(std::string element);
  Tk_ref(Tk_ref &&) = default;
  Tk_ref &operator=(Tk_ref &&) = default;
};
class Preprocessor_elsif_statements : public Node {
public:
  Preprocessor_elsif_statements(std::string element);
  Preprocessor_elsif_statements(Preprocessor_elsif_statements &&) = default;
  Preprocessor_elsif_statements &
  operator=(Preprocessor_elsif_statements &&) = default;
};
class Tk_xnor : public Node {
public:
  Tk_xnor(std::string element);
  Tk_xnor(Tk_xnor &&) = default;
  Tk_xnor &operator=(Tk_xnor &&) = default;
};
class Tk_supply1 : public Node {
public:
  Tk_supply1(std::string element);
  Tk_supply1(Tk_supply1 &&) = default;
  Tk_supply1 &operator=(Tk_supply1 &&) = default;
};
class Tk_const : public Node {
public:
  Tk_const(std::string element);
  Tk_const(Tk_const &&) = default;
  Tk_const &operator=(Tk_const &&) = default;
};
class Tk_local_scope : public Node {
public:
  Tk_local_scope(std::string element);
  Tk_local_scope(Tk_local_scope &&) = default;
  Tk_local_scope &operator=(Tk_local_scope &&) = default;
};
class Tk_strong1 : public Node {
public:
  Tk_strong1(std::string element);
  Tk_strong1(Tk_strong1 &&) = default;
  Tk_strong1 &operator=(Tk_strong1 &&) = default;
};
class Tk_release : public Node {
public:
  Tk_release(std::string element);
  Tk_release(Tk_release &&) = default;
  Tk_release &operator=(Tk_release &&) = default;
};
class Discipline_items_opt : public Node {
public:
  Discipline_items_opt(std::string element);
  Discipline_items_opt(Discipline_items_opt &&) = default;
  Discipline_items_opt &operator=(Discipline_items_opt &&) = default;
};
class Tk_program : public Node {
public:
  Tk_program(std::string element);
  Tk_program(Tk_program &&) = default;
  Tk_program &operator=(Tk_program &&) = default;
};
class Preprocessor_elsif_module_item : public Node {
public:
  Preprocessor_elsif_module_item(std::string element);
  Preprocessor_elsif_module_item(Preprocessor_elsif_module_item &&) = default;
  Preprocessor_elsif_module_item &
  operator=(Preprocessor_elsif_module_item &&) = default;
};
class Preprocessor_else_statement_opt : public Node {
public:
  Preprocessor_else_statement_opt(std::string element);
  Preprocessor_else_statement_opt(Preprocessor_else_statement_opt &&) = default;
  Preprocessor_else_statement_opt &
  operator=(Preprocessor_else_statement_opt &&) = default;
};
class Tk_always : public Node {
public:
  Tk_always(std::string element);
  Tk_always(Tk_always &&) = default;
  Tk_always &operator=(Tk_always &&) = default;
};
class Preprocessor_elsif_class_item : public Node {
public:
  Preprocessor_elsif_class_item(std::string element);
  Preprocessor_elsif_class_item(Preprocessor_elsif_class_item &&) = default;
  Preprocessor_elsif_class_item &
  operator=(Preprocessor_elsif_class_item &&) = default;
};
class Tk_table : public Node {
public:
  Tk_table(std::string element);
  Tk_table(Tk_table &&) = default;
  Tk_table &operator=(Tk_table &&) = default;
};
class Tk_trigger : public Node {
public:
  Tk_trigger(std::string element);
  Tk_trigger(Tk_trigger &&) = default;
  Tk_trigger &operator=(Tk_trigger &&) = default;
};
class Tk_liblist : public Node {
public:
  Tk_liblist(std::string element);
  Tk_liblist(Tk_liblist &&) = default;
  Tk_liblist &operator=(Tk_liblist &&) = default;
};
class Preprocessor_elsif_header : public Node {
public:
  Preprocessor_elsif_header(std::string element);
  Preprocessor_elsif_header(Preprocessor_elsif_header &&) = default;
  Preprocessor_elsif_header &operator=(Preprocessor_elsif_header &&) = default;
};
class Tk_pure : public Node {
public:
  Tk_pure(std::string element);
  Tk_pure(Tk_pure &&) = default;
  Tk_pure &operator=(Tk_pure &&) = default;
};
class Tk_case : public Node {
public:
  Tk_case(std::string element);
  Tk_case(Tk_case &&) = default;
  Tk_case &operator=(Tk_case &&) = default;
};
class Tk_shold : public Node {
public:
  Tk_shold(std::string element);
  Tk_shold(Tk_shold &&) = default;
  Tk_shold &operator=(Tk_shold &&) = default;
};
class Tk_lbrarrow : public Node {
public:
  Tk_lbrarrow(std::string element);
  Tk_lbrarrow(Tk_lbrarrow &&) = default;
  Tk_lbrarrow &operator=(Tk_lbrarrow &&) = default;
};
class Tk_package : public Node {
public:
  Tk_package(std::string element);
  Tk_package(Tk_package &&) = default;
  Tk_package &operator=(Tk_package &&) = default;
};
class Tk_always_ff : public Node {
public:
  Tk_always_ff(std::string element);
  Tk_always_ff(Tk_always_ff &&) = default;
  Tk_always_ff &operator=(Tk_always_ff &&) = default;
};
class Tk_filepath : public Node {
public:
  Tk_filepath(std::string element);
  Tk_filepath(Tk_filepath &&) = default;
  Tk_filepath &operator=(Tk_filepath &&) = default;
};
class Tk_colon_eq : public Node {
public:
  Tk_colon_eq(std::string element);
  Tk_colon_eq(Tk_colon_eq &&) = default;
  Tk_colon_eq &operator=(Tk_colon_eq &&) = default;
};
class Preprocessor_elsif_config_rule_statements_opt : public Node {
public:
  Preprocessor_elsif_config_rule_statements_opt(std::string element);
  Preprocessor_elsif_config_rule_statements_opt(
      Preprocessor_elsif_config_rule_statements_opt &&) = default;
  Preprocessor_elsif_config_rule_statements_opt &
  operator=(Preprocessor_elsif_config_rule_statements_opt &&) = default;
};
class Tk_pulldown : public Node {
public:
  Tk_pulldown(std::string element);
  Tk_pulldown(Tk_pulldown &&) = default;
  Tk_pulldown &operator=(Tk_pulldown &&) = default;
};
class Tk_rpmos : public Node {
public:
  Tk_rpmos(std::string element);
  Tk_rpmos(Tk_rpmos &&) = default;
  Tk_rpmos &operator=(Tk_rpmos &&) = default;
};
class Preprocessor_else_generate_item_opt : public Node {
public:
  Preprocessor_else_generate_item_opt(std::string element);
  Preprocessor_else_generate_item_opt(Preprocessor_else_generate_item_opt &&) =
      default;
  Preprocessor_else_generate_item_opt &
  operator=(Preprocessor_else_generate_item_opt &&) = default;
};
class Tk_bit : public Node {
public:
  Tk_bit(std::string element);
  Tk_bit(Tk_bit &&) = default;
  Tk_bit &operator=(Tk_bit &&) = default;
};
class Tk_chandle : public Node {
public:
  Tk_chandle(std::string element);
  Tk_chandle(Tk_chandle &&) = default;
  Tk_chandle &operator=(Tk_chandle &&) = default;
};
class Preprocessor_elsif_bins_or_options_list : public Node {
public:
  Preprocessor_elsif_bins_or_options_list(std::string element);
  Preprocessor_elsif_bins_or_options_list(
      Preprocessor_elsif_bins_or_options_list &&) = default;
  Preprocessor_elsif_bins_or_options_list &
  operator=(Preprocessor_elsif_bins_or_options_list &&) = default;
};
class Tk_binsof : public Node {
public:
  Tk_binsof(std::string element);
  Tk_binsof(Tk_binsof &&) = default;
  Tk_binsof &operator=(Tk_binsof &&) = default;
};
class Macro_args_opt : public Node {
public:
  Macro_args_opt(std::string element);
  Macro_args_opt(Macro_args_opt &&) = default;
  Macro_args_opt &operator=(Macro_args_opt &&) = default;
};
class Tk_srecovery : public Node {
public:
  Tk_srecovery(std::string element);
  Tk_srecovery(Tk_srecovery &&) = default;
  Tk_srecovery &operator=(Tk_srecovery &&) = default;
};
class Tk_config : public Node {
public:
  Tk_config(std::string element);
  Tk_config(Tk_config &&) = default;
  Tk_config &operator=(Tk_config &&) = default;
};
class Tk_nonblocking_trigger : public Node {
public:
  Tk_nonblocking_trigger(std::string element);
  Tk_nonblocking_trigger(Tk_nonblocking_trigger &&) = default;
  Tk_nonblocking_trigger &operator=(Tk_nonblocking_trigger &&) = default;
};
class Tk_shuffle : public Node {
public:
  Tk_shuffle(std::string element);
  Tk_shuffle(Tk_shuffle &&) = default;
  Tk_shuffle &operator=(Tk_shuffle &&) = default;
};
class Tk_signed : public Node {
public:
  Tk_signed(std::string element);
  Tk_signed(Tk_signed &&) = default;
  Tk_signed &operator=(Tk_signed &&) = default;
};
class Tk_incr : public Node {
public:
  Tk_incr(std::string element);
  Tk_incr(Tk_incr &&) = default;
  Tk_incr &operator=(Tk_incr &&) = default;
};
class Tk_always_latch : public Node {
public:
  Tk_always_latch(std::string element);
  Tk_always_latch(Tk_always_latch &&) = default;
  Tk_always_latch &operator=(Tk_always_latch &&) = default;
};
class Preprocessor_balanced_generate_items : public Node {
public:
  Preprocessor_balanced_generate_items(std::string element);
  Preprocessor_balanced_generate_items(
      Preprocessor_balanced_generate_items &&) = default;
  Preprocessor_balanced_generate_items &
  operator=(Preprocessor_balanced_generate_items &&) = default;
};
class Tk_product : public Node {
public:
  Tk_product(std::string element);
  Tk_product(Tk_product &&) = default;
  Tk_product &operator=(Tk_product &&) = default;
};
class Preprocessor_else_module_item_opt : public Node {
public:
  Preprocessor_else_module_item_opt(std::string element);
  Preprocessor_else_module_item_opt(Preprocessor_else_module_item_opt &&) =
      default;
  Preprocessor_else_module_item_opt &
  operator=(Preprocessor_else_module_item_opt &&) = default;
};
class Tk_input : public Node {
public:
  Tk_input(std::string element);
  Tk_input(Tk_input &&) = default;
  Tk_input &operator=(Tk_input &&) = default;
};
class Tk_assign : public Node {
public:
  Tk_assign(std::string element);
  Tk_assign(Tk_assign &&) = default;
  Tk_assign &operator=(Tk_assign &&) = default;
};
class Preprocessor_elsif_description_items_opt : public Node {
public:
  Preprocessor_elsif_description_items_opt(std::string element);
  Preprocessor_elsif_description_items_opt(
      Preprocessor_elsif_description_items_opt &&) = default;
  Preprocessor_elsif_description_items_opt &
  operator=(Preprocessor_elsif_description_items_opt &&) = default;
};
class Dr_delay_mode_distributed : public Node {
public:
  Dr_delay_mode_distributed(std::string element);
  Dr_delay_mode_distributed(Dr_delay_mode_distributed &&) = default;
  Dr_delay_mode_distributed &operator=(Dr_delay_mode_distributed &&) = default;
};
class Preprocessor_else_package_item : public Node {
public:
  Preprocessor_else_package_item(std::string element);
  Preprocessor_else_package_item(Preprocessor_else_package_item &&) = default;
  Preprocessor_else_package_item &
  operator=(Preprocessor_else_package_item &&) = default;
};
class Bins_or_options_list_opt_pp : public Node {
public:
  Bins_or_options_list_opt_pp(std::string element);
  Bins_or_options_list_opt_pp(Bins_or_options_list_opt_pp &&) = default;
  Bins_or_options_list_opt_pp &
  operator=(Bins_or_options_list_opt_pp &&) = default;
};
class Preprocessor_elsif_package_items_opt : public Node {
public:
  Preprocessor_elsif_package_items_opt(std::string element);
  Preprocessor_elsif_package_items_opt(
      Preprocessor_elsif_package_items_opt &&) = default;
  Preprocessor_elsif_package_items_opt &
  operator=(Preprocessor_elsif_package_items_opt &&) = default;
};
class Tk_s_until_with : public Node {
public:
  Tk_s_until_with(std::string element);
  Tk_s_until_with(Tk_s_until_with &&) = default;
  Tk_s_until_with &operator=(Tk_s_until_with &&) = default;
};
class Rs_case_item : public Node {
public:
  Rs_case_item(std::string element);
  Rs_case_item(Rs_case_item &&) = default;
  Rs_case_item &operator=(Rs_case_item &&) = default;
};
class Any_port_list_preprocessor_last_positional : public Node {
public:
  Any_port_list_preprocessor_last_positional(std::string element);
  Any_port_list_preprocessor_last_positional(
      Any_port_list_preprocessor_last_positional &&) = default;
  Any_port_list_preprocessor_last_positional &
  operator=(Any_port_list_preprocessor_last_positional &&) = default;
};
class Tk_ignore_bins : public Node {
public:
  Tk_ignore_bins(std::string element);
  Tk_ignore_bins(Tk_ignore_bins &&) = default;
  Tk_ignore_bins &operator=(Tk_ignore_bins &&) = default;
};
class Tk_sum : public Node {
public:
  Tk_sum(std::string element);
  Tk_sum(Tk_sum &&) = default;
  Tk_sum &operator=(Tk_sum &&) = default;
};
class Tkk_attribute : public Node {
public:
  Tkk_attribute(std::string element);
  Tkk_attribute(Tkk_attribute &&) = default;
  Tkk_attribute &operator=(Tkk_attribute &&) = default;
};
class Tk_max : public Node {
public:
  Tk_max(std::string element);
  Tk_max(Tk_max &&) = default;
  Tk_max &operator=(Tk_max &&) = default;
};
class Preprocessor_else_constraint_block_item_opt : public Node {
public:
  Preprocessor_else_constraint_block_item_opt(std::string element);
  Preprocessor_else_constraint_block_item_opt(
      Preprocessor_else_constraint_block_item_opt &&) = default;
  Preprocessor_else_constraint_block_item_opt &
  operator=(Preprocessor_else_constraint_block_item_opt &&) = default;
};
class Tk_nexttime : public Node {
public:
  Tk_nexttime(std::string element);
  Tk_nexttime(Tk_nexttime &&) = default;
  Tk_nexttime &operator=(Tk_nexttime &&) = default;
};
class Tk_sequence : public Node {
public:
  Tk_sequence(std::string element);
  Tk_sequence(Tk_sequence &&) = default;
  Tk_sequence &operator=(Tk_sequence &&) = default;
};
class Tk_automatic : public Node {
public:
  Tk_automatic(std::string element);
  Tk_automatic(Tk_automatic &&) = default;
  Tk_automatic &operator=(Tk_automatic &&) = default;
};
class Preprocessor_else_statement : public Node {
public:
  Preprocessor_else_statement(std::string element);
  Preprocessor_else_statement(Preprocessor_else_statement &&) = default;
  Preprocessor_else_statement &
  operator=(Preprocessor_else_statement &&) = default;
};
class Tk_pullup : public Node {
public:
  Tk_pullup(std::string element);
  Tk_pullup(Tk_pullup &&) = default;
  Tk_pullup &operator=(Tk_pullup &&) = default;
};
class Preprocessor_elsif_description_items : public Node {
public:
  Preprocessor_elsif_description_items(std::string element);
  Preprocessor_elsif_description_items(
      Preprocessor_elsif_description_items &&) = default;
  Preprocessor_elsif_description_items &
  operator=(Preprocessor_elsif_description_items &&) = default;
};
class Enum_name_list_preprocessor_last : public Node {
public:
  Enum_name_list_preprocessor_last(std::string element);
  Enum_name_list_preprocessor_last(Enum_name_list_preprocessor_last &&) =
      default;
  Enum_name_list_preprocessor_last &
  operator=(Enum_name_list_preprocessor_last &&) = default;
};
class From_exclude : public Node {
public:
  From_exclude(std::string element);
  From_exclude(From_exclude &&) = default;
  From_exclude &operator=(From_exclude &&) = default;
};
class Tk_int : public Node {
public:
  Tk_int(std::string element);
  Tk_int(Tk_int &&) = default;
  Tk_int &operator=(Tk_int &&) = default;
};
class Tk_join : public Node {
public:
  Tk_join(std::string element);
  Tk_join(Tk_join &&) = default;
  Tk_join &operator=(Tk_join &&) = default;
};
class Tk_find_first_index : public Node {
public:
  Tk_find_first_index(std::string element);
  Tk_find_first_index(Tk_find_first_index &&) = default;
  Tk_find_first_index &operator=(Tk_find_first_index &&) = default;
};
class Tk_implements : public Node {
public:
  Tk_implements(std::string element);
  Tk_implements(Tk_implements &&) = default;
  Tk_implements &operator=(Tk_implements &&) = default;
};
class Discipline_item : public Node {
public:
  Discipline_item(std::string element);
  Discipline_item(Discipline_item &&) = default;
  Discipline_item &operator=(Discipline_item &&) = default;
};
class Block_event_expression : public Node {
public:
  Block_event_expression(std::string element);
  Block_event_expression(Block_event_expression &&) = default;
  Block_event_expression &operator=(Block_event_expression &&) = default;
};
class Tk_discipline : public Node {
public:
  Tk_discipline(std::string element);
  Tk_discipline(Tk_discipline &&) = default;
  Tk_discipline &operator=(Tk_discipline &&) = default;
};
class Include_statement : public Node {
public:
  Include_statement(std::string element);
  Include_statement(Include_statement &&) = default;
  Include_statement &operator=(Include_statement &&) = default;
};
class Tk_lbstar : public Node {
public:
  Tk_lbstar(std::string element);
  Tk_lbstar(Tk_lbstar &&) = default;
  Tk_lbstar &operator=(Tk_lbstar &&) = default;
};
class Preprocessor_elsif_bins_or_options_list_opt : public Node {
public:
  Preprocessor_elsif_bins_or_options_list_opt(std::string element);
  Preprocessor_elsif_bins_or_options_list_opt(
      Preprocessor_elsif_bins_or_options_list_opt &&) = default;
  Preprocessor_elsif_bins_or_options_list_opt &
  operator=(Preprocessor_elsif_bins_or_options_list_opt &&) = default;
};
class Tk_lbeq : public Node {
public:
  Tk_lbeq(std::string element);
  Tk_lbeq(Tk_lbeq &&) = default;
  Tk_lbeq &operator=(Tk_lbeq &&) = default;
};
class Tk_void : public Node {
public:
  Tk_void(std::string element);
  Tk_void(Tk_void &&) = default;
  Tk_void &operator=(Tk_void &&) = default;
};
class Tk_exclude : public Node {
public:
  Tk_exclude(std::string element);
  Tk_exclude(Tk_exclude &&) = default;
  Tk_exclude &operator=(Tk_exclude &&) = default;
};
class Tk_randc : public Node {
public:
  Tk_randc(std::string element);
  Tk_randc(Tk_randc &&) = default;
  Tk_randc &operator=(Tk_randc &&) = default;
};
class Tk_weak : public Node {
public:
  Tk_weak(std::string element);
  Tk_weak(Tk_weak &&) = default;
  Tk_weak &operator=(Tk_weak &&) = default;
};
class Tk_instance : public Node {
public:
  Tk_instance(std::string element);
  Tk_instance(Tk_instance &&) = default;
  Tk_instance &operator=(Tk_instance &&) = default;
};
class Tk_type_option : public Node {
public:
  Tk_type_option(std::string element);
  Tk_type_option(Tk_type_option &&) = default;
  Tk_type_option &operator=(Tk_type_option &&) = default;
};
class Tk_wait : public Node {
public:
  Tk_wait(std::string element);
  Tk_wait(Tk_wait &&) = default;
  Tk_wait &operator=(Tk_wait &&) = default;
};
class Tk_abstol : public Node {
public:
  Tk_abstol(std::string element);
  Tk_abstol(Tk_abstol &&) = default;
  Tk_abstol &operator=(Tk_abstol &&) = default;
};
class Tk_decr : public Node {
public:
  Tk_decr(std::string element);
  Tk_decr(Tk_decr &&) = default;
  Tk_decr &operator=(Tk_decr &&) = default;
};
class Tk_xor : public Node {
public:
  Tk_xor(std::string element);
  Tk_xor(Tk_xor &&) = default;
  Tk_xor &operator=(Tk_xor &&) = default;
};
class Tk_timeprecision : public Node {
public:
  Tk_timeprecision(std::string element);
  Tk_timeprecision(Tk_timeprecision &&) = default;
  Tk_timeprecision &operator=(Tk_timeprecision &&) = default;
};
class Dr_delay_mode_zero : public Node {
public:
  Dr_delay_mode_zero(std::string element);
  Dr_delay_mode_zero(Dr_delay_mode_zero &&) = default;
  Dr_delay_mode_zero &operator=(Dr_delay_mode_zero &&) = default;
};
class Tk_find_first : public Node {
public:
  Tk_find_first(std::string element);
  Tk_find_first(Tk_find_first &&) = default;
  Tk_find_first &operator=(Tk_find_first &&) = default;
};
class Tk_pulsestyle_onevent : public Node {
public:
  Tk_pulsestyle_onevent(std::string element);
  Tk_pulsestyle_onevent(Tk_pulsestyle_onevent &&) = default;
  Tk_pulsestyle_onevent &operator=(Tk_pulsestyle_onevent &&) = default;
};
class Tk_covergroup : public Node {
public:
  Tk_covergroup(std::string element);
  Tk_covergroup(Tk_covergroup &&) = default;
  Tk_covergroup &operator=(Tk_covergroup &&) = default;
};
class Preprocessor_elsif_constraint_block_items_opt : public Node {
public:
  Preprocessor_elsif_constraint_block_items_opt(std::string element);
  Preprocessor_elsif_constraint_block_items_opt(
      Preprocessor_elsif_constraint_block_items_opt &&) = default;
  Preprocessor_elsif_constraint_block_items_opt &
  operator=(Preprocessor_elsif_constraint_block_items_opt &&) = default;
};
class Macro_digits : public Node {
public:
  Macro_digits(std::string element);
  Macro_digits(Macro_digits &&) = default;
  Macro_digits &operator=(Macro_digits &&) = default;
};
class Tk_units : public Node {
public:
  Tk_units(std::string element);
  Tk_units(Tk_units &&) = default;
  Tk_units &operator=(Tk_units &&) = default;
};
class Tk_tran : public Node {
public:
  Tk_tran(std::string element);
  Tk_tran(Tk_tran &&) = default;
  Tk_tran &operator=(Tk_tran &&) = default;
};
class Tk_wildcard : public Node {
public:
  Tk_wildcard(std::string element);
  Tk_wildcard(Tk_wildcard &&) = default;
  Tk_wildcard &operator=(Tk_wildcard &&) = default;
};
class Preprocessor_balanced_bins_or_options_list : public Node {
public:
  Preprocessor_balanced_bins_or_options_list(std::string element);
  Preprocessor_balanced_bins_or_options_list(
      Preprocessor_balanced_bins_or_options_list &&) = default;
  Preprocessor_balanced_bins_or_options_list &
  operator=(Preprocessor_balanced_bins_or_options_list &&) = default;
};
class Tk_final : public Node {
public:
  Tk_final(std::string element);
  Tk_final(Tk_final &&) = default;
  Tk_final &operator=(Tk_final &&) = default;
};
class Preprocessor_else_package_item_opt : public Node {
public:
  Preprocessor_else_package_item_opt(std::string element);
  Preprocessor_else_package_item_opt(Preprocessor_else_package_item_opt &&) =
      default;
  Preprocessor_else_package_item_opt &
  operator=(Preprocessor_else_package_item_opt &&) = default;
};
class Preprocessor_elsif_class_items : public Node {
public:
  Preprocessor_elsif_class_items(std::string element);
  Preprocessor_elsif_class_items(Preprocessor_elsif_class_items &&) = default;
  Preprocessor_elsif_class_items &
  operator=(Preprocessor_elsif_class_items &&) = default;
};
class Any_argument_list_preprocessor_last : public Node {
public:
  Any_argument_list_preprocessor_last(std::string element);
  Any_argument_list_preprocessor_last(Any_argument_list_preprocessor_last &&) =
      default;
  Any_argument_list_preprocessor_last &
  operator=(Any_argument_list_preprocessor_last &&) = default;
};
class Tk_sort : public Node {
public:
  Tk_sort(std::string element);
  Tk_sort(Tk_sort &&) = default;
  Tk_sort &operator=(Tk_sort &&) = default;
};
class Incdir_spec : public Node {
public:
  Incdir_spec(std::string element);
  Incdir_spec(Incdir_spec &&) = default;
  Incdir_spec &operator=(Incdir_spec &&) = default;
};
class Preprocessor_if_header : public Node {
public:
  Preprocessor_if_header(std::string element);
  Preprocessor_if_header(Preprocessor_if_header &&) = default;
  Preprocessor_if_header &operator=(Preprocessor_if_header &&) = default;
};
class Dr_disable_portfaults : public Node {
public:
  Dr_disable_portfaults(std::string element);
  Dr_disable_portfaults(Dr_disable_portfaults &&) = default;
  Dr_disable_portfaults &operator=(Dr_disable_portfaults &&) = default;
};
class Tk_s_nexttime : public Node {
public:
  Tk_s_nexttime(std::string element);
  Tk_s_nexttime(Tk_s_nexttime &&) = default;
  Tk_s_nexttime &operator=(Tk_s_nexttime &&) = default;
};
class Tk_with : public Node {
public:
  Tk_with(std::string element);
  Tk_with(Tk_with &&) = default;
  Tk_with &operator=(Tk_with &&) = default;
};
class Dr_unconnected_drive : public Node {
public:
  Dr_unconnected_drive(std::string element);
  Dr_unconnected_drive(Dr_unconnected_drive &&) = default;
  Dr_unconnected_drive &operator=(Dr_unconnected_drive &&) = default;
};
class Tk_snochange : public Node {
public:
  Tk_snochange(std::string element);
  Tk_snochange(Tk_snochange &&) = default;
  Tk_snochange &operator=(Tk_snochange &&) = default;
};
class Macro_call_or_item : public Node {
public:
  Macro_call_or_item(std::string element);
  Macro_call_or_item(Macro_call_or_item &&) = default;
  Macro_call_or_item &operator=(Macro_call_or_item &&) = default;
};
class Library_description_list_opt : public Node {
public:
  Library_description_list_opt(std::string element);
  Library_description_list_opt(Library_description_list_opt &&) = default;
  Library_description_list_opt &
  operator=(Library_description_list_opt &&) = default;
};
class Preprocessor_elsif_port_declaration : public Node {
public:
  Preprocessor_elsif_port_declaration(std::string element);
  Preprocessor_elsif_port_declaration(Preprocessor_elsif_port_declaration &&) =
      default;
  Preprocessor_elsif_port_declaration &
  operator=(Preprocessor_elsif_port_declaration &&) = default;
};
class Tk_context : public Node {
public:
  Tk_context(std::string element);
  Tk_context(Tk_context &&) = default;
  Tk_context &operator=(Tk_context &&) = default;
};
class Tk_include : public Node {
public:
  Tk_include(std::string element);
  Tk_include(Tk_include &&) = default;
  Tk_include &operator=(Tk_include &&) = default;
};
class Tk_var : public Node {
public:
  Tk_var(std::string element);
  Tk_var(Tk_var &&) = default;
  Tk_var &operator=(Tk_var &&) = default;
};
class Preprocessor_balanced_constraint_block_item : public Node {
public:
  Preprocessor_balanced_constraint_block_item(std::string element);
  Preprocessor_balanced_constraint_block_item(
      Preprocessor_balanced_constraint_block_item &&) = default;
  Preprocessor_balanced_constraint_block_item &
  operator=(Preprocessor_balanced_constraint_block_item &&) = default;
};
class Tk_module : public Node {
public:
  Tk_module(std::string element);
  Tk_module(Tk_module &&) = default;
  Tk_module &operator=(Tk_module &&) = default;
};
class Dr_uselib : public Node {
public:
  Dr_uselib(std::string element);
  Dr_uselib(Dr_uselib &&) = default;
  Dr_uselib &operator=(Dr_uselib &&) = default;
};
class Constraint_declaration_package_item : public Node {
public:
  Constraint_declaration_package_item(std::string element);
  Constraint_declaration_package_item(Constraint_declaration_package_item &&) =
      default;
  Constraint_declaration_package_item &
  operator=(Constraint_declaration_package_item &&) = default;
};
class Dr_nounconnected_drive : public Node {
public:
  Dr_nounconnected_drive(std::string element);
  Dr_nounconnected_drive(Dr_nounconnected_drive &&) = default;
  Dr_nounconnected_drive &operator=(Dr_nounconnected_drive &&) = default;
};
class Tk_event : public Node {
public:
  Tk_event(std::string element);
  Tk_event(Tk_event &&) = default;
  Tk_event &operator=(Tk_event &&) = default;
};
class Tk_access : public Node {
public:
  Tk_access(std::string element);
  Tk_access(Tk_access &&) = default;
  Tk_access &operator=(Tk_access &&) = default;
};
class Tk_typedef : public Node {
public:
  Tk_typedef(std::string element);
  Tk_typedef(Tk_typedef &&) = default;
  Tk_typedef &operator=(Tk_typedef &&) = default;
};
class Library_description : public Node {
public:
  Library_description(std::string element);
  Library_description(Library_description &&) = default;
  Library_description &operator=(Library_description &&) = default;
};
class Preprocessor_balanced_description_items : public Node {
public:
  Preprocessor_balanced_description_items(std::string element);
  Preprocessor_balanced_description_items(
      Preprocessor_balanced_description_items &&) = default;
  Preprocessor_balanced_description_items &
  operator=(Preprocessor_balanced_description_items &&) = default;
};
class Preprocessor_elsif_port_declarations : public Node {
public:
  Preprocessor_elsif_port_declarations(std::string element);
  Preprocessor_elsif_port_declarations(
      Preprocessor_elsif_port_declarations &&) = default;
  Preprocessor_elsif_port_declarations &
  operator=(Preprocessor_elsif_port_declarations &&) = default;
};
class Preprocessor_else_bins_or_options_opt : public Node {
public:
  Preprocessor_else_bins_or_options_opt(std::string element);
  Preprocessor_else_bins_or_options_opt(
      Preprocessor_else_bins_or_options_opt &&) = default;
  Preprocessor_else_bins_or_options_opt &
  operator=(Preprocessor_else_bins_or_options_opt &&) = default;
};
class Preprocessor_else_port_declarations : public Node {
public:
  Preprocessor_else_port_declarations(std::string element);
  Preprocessor_else_port_declarations(Preprocessor_else_port_declarations &&) =
      default;
  Preprocessor_else_port_declarations &
  operator=(Preprocessor_else_port_declarations &&) = default;
};
class Tk_until_with : public Node {
public:
  Tk_until_with(std::string element);
  Tk_until_with(Tk_until_with &&) = default;
  Tk_until_with &operator=(Tk_until_with &&) = default;
};
class Tk_atat : public Node {
public:
  Tk_atat(std::string element);
  Tk_atat(Tk_atat &&) = default;
  Tk_atat &operator=(Tk_atat &&) = default;
};
class Tk_option : public Node {
public:
  Tk_option(std::string element);
  Tk_option(Tk_option &&) = default;
  Tk_option &operator=(Tk_option &&) = default;
};
class Tk_negedge : public Node {
public:
  Tk_negedge(std::string element);
  Tk_negedge(Tk_negedge &&) = default;
  Tk_negedge &operator=(Tk_negedge &&) = default;
};
class Tk_until : public Node {
public:
  Tk_until(std::string element);
  Tk_until(Tk_until &&) = default;
  Tk_until &operator=(Tk_until &&) = default;
};
class Tk_po_neg : public Node {
public:
  Tk_po_neg(std::string element);
  Tk_po_neg(Tk_po_neg &&) = default;
  Tk_po_neg &operator=(Tk_po_neg &&) = default;
};
class Preprocessor_balanced_config_rule_statements : public Node {
public:
  Preprocessor_balanced_config_rule_statements(std::string element);
  Preprocessor_balanced_config_rule_statements(
      Preprocessor_balanced_config_rule_statements &&) = default;
  Preprocessor_balanced_config_rule_statements &
  operator=(Preprocessor_balanced_config_rule_statements &&) = default;
};
class Member_pattern : public Node {
public:
  Member_pattern(std::string element);
  Member_pattern(Member_pattern &&) = default;
  Member_pattern &operator=(Member_pattern &&) = default;
};
class Tk_weak1 : public Node {
public:
  Tk_weak1(std::string element);
  Tk_weak1(Tk_weak1 &&) = default;
  Tk_weak1 &operator=(Tk_weak1 &&) = default;
};
class Tk_1step : public Node {
public:
  Tk_1step(std::string element);
  Tk_1step(Tk_1step &&) = default;
  Tk_1step &operator=(Tk_1step &&) = default;
};
class Parameter_value_byname_list_preprocessor_last : public Node {
public:
  Parameter_value_byname_list_preprocessor_last(std::string element);
  Parameter_value_byname_list_preprocessor_last(
      Parameter_value_byname_list_preprocessor_last &&) = default;
  Parameter_value_byname_list_preprocessor_last &
  operator=(Parameter_value_byname_list_preprocessor_last &&) = default;
};
class Tk_unsigned : public Node {
public:
  Tk_unsigned(std::string element);
  Tk_unsigned(Tk_unsigned &&) = default;
  Tk_unsigned &operator=(Tk_unsigned &&) = default;
};
class Macro_arg_opt : public Node {
public:
  Macro_arg_opt(std::string element);
  Macro_arg_opt(Macro_arg_opt &&) = default;
  Macro_arg_opt &operator=(Macro_arg_opt &&) = default;
};
class Tk_tagged : public Node {
public:
  Tk_tagged(std::string element);
  Tk_tagged(Tk_tagged &&) = default;
  Tk_tagged &operator=(Tk_tagged &&) = default;
};
class Tk_scope_res : public Node {
public:
  Tk_scope_res(std::string element);
  Tk_scope_res(Tk_scope_res &&) = default;
  Tk_scope_res &operator=(Tk_scope_res &&) = default;
};
class Dr_endprotect : public Node {
public:
  Dr_endprotect(std::string element);
  Dr_endprotect(Dr_endprotect &&) = default;
  Dr_endprotect &operator=(Dr_endprotect &&) = default;
};
class Dr_delay_mode_unit : public Node {
public:
  Dr_delay_mode_unit(std::string element);
  Dr_delay_mode_unit(Dr_delay_mode_unit &&) = default;
  Dr_delay_mode_unit &operator=(Dr_delay_mode_unit &&) = default;
};
class Parameter_value_ranges : public Node {
public:
  Parameter_value_ranges(std::string element);
  Parameter_value_ranges(Parameter_value_ranges &&) = default;
  Parameter_value_ranges &operator=(Parameter_value_ranges &&) = default;
};
class Nature_item : public Node {
public:
  Nature_item(std::string element);
  Nature_item(Nature_item &&) = default;
  Nature_item &operator=(Nature_item &&) = default;
};
class Tk_virtual : public Node {
public:
  Tk_virtual(std::string element);
  Tk_virtual(Tk_virtual &&) = default;
  Tk_virtual &operator=(Tk_virtual &&) = default;
};
class Tk_with__covergroup : public Node {
public:
  Tk_with__covergroup(std::string element);
  Tk_with__covergroup(Tk_with__covergroup &&) = default;
  Tk_with__covergroup &operator=(Tk_with__covergroup &&) = default;
};
class Error : public Node {
public:
  Error(std::string element);
  Error(Error &&) = default;
  Error &operator=(Error &&) = default;
};
class Tk_specparam : public Node {
public:
  Tk_specparam(std::string element);
  Tk_specparam(Tk_specparam &&) = default;
  Tk_specparam &operator=(Tk_specparam &&) = default;
};
class Tk_assume : public Node {
public:
  Tk_assume(std::string element);
  Tk_assume(Tk_assume &&) = default;
  Tk_assume &operator=(Tk_assume &&) = default;
};
class Tk_uwire : public Node {
public:
  Tk_uwire(std::string element);
  Tk_uwire(Tk_uwire &&) = default;
  Tk_uwire &operator=(Tk_uwire &&) = default;
};
class Tk_rtran : public Node {
public:
  Tk_rtran(std::string element);
  Tk_rtran(Tk_rtran &&) = default;
  Tk_rtran &operator=(Tk_rtran &&) = default;
};
class Preprocessor_elsif_constraint_expressions_opt : public Node {
public:
  Preprocessor_elsif_constraint_expressions_opt(std::string element);
  Preprocessor_elsif_constraint_expressions_opt(
      Preprocessor_elsif_constraint_expressions_opt &&) = default;
  Preprocessor_elsif_constraint_expressions_opt &
  operator=(Preprocessor_elsif_constraint_expressions_opt &&) = default;
};
class Tk_sync_accept_on : public Node {
public:
  Tk_sync_accept_on(std::string element);
  Tk_sync_accept_on(Tk_sync_accept_on &&) = default;
  Tk_sync_accept_on &operator=(Tk_sync_accept_on &&) = default;
};
class Tk_coverpoint : public Node {
public:
  Tk_coverpoint(std::string element);
  Tk_coverpoint(Tk_coverpoint &&) = default;
  Tk_coverpoint &operator=(Tk_coverpoint &&) = default;
};
class Tk_rnmos : public Node {
public:
  Tk_rnmos(std::string element);
  Tk_rnmos(Tk_rnmos &&) = default;
  Tk_rnmos &operator=(Tk_rnmos &&) = default;
};
class Tk_eventually : public Node {
public:
  Tk_eventually(std::string element);
  Tk_eventually(Tk_eventually &&) = default;
  Tk_eventually &operator=(Tk_eventually &&) = default;
};
class Preprocessor_else_description_item : public Node {
public:
  Preprocessor_else_description_item(std::string element);
  Preprocessor_else_description_item(Preprocessor_else_description_item &&) =
      default;
  Preprocessor_else_description_item &
  operator=(Preprocessor_else_description_item &&) = default;
};
class Tk_this : public Node {
public:
  Tk_this(std::string element);
  Tk_this(Tk_this &&) = default;
  Tk_this &operator=(Tk_this &&) = default;
};
class Tk_do : public Node {
public:
  Tk_do(std::string element);
  Tk_do(Tk_do &&) = default;
  Tk_do &operator=(Tk_do &&) = default;
};
class Tk_modport : public Node {
public:
  Tk_modport(std::string element);
  Tk_modport(Tk_modport &&) = default;
  Tk_modport &operator=(Tk_modport &&) = default;
};
class Tk_soft : public Node {
public:
  Tk_soft(std::string element);
  Tk_soft(Tk_soft &&) = default;
  Tk_soft &operator=(Tk_soft &&) = default;
};
class Dr_default_trireg_strength : public Node {
public:
  Dr_default_trireg_strength(std::string element);
  Dr_default_trireg_strength(Dr_default_trireg_strength &&) = default;
  Dr_default_trireg_strength &
  operator=(Dr_default_trireg_strength &&) = default;
};
class Tk_trireg : public Node {
public:
  Tk_trireg(std::string element);
  Tk_trireg(Tk_trireg &&) = default;
  Tk_trireg &operator=(Tk_trireg &&) = default;
};
class Description_list_opt : public Node {
public:
  Description_list_opt(std::string element);
  Description_list_opt(Description_list_opt &&) = default;
  Description_list_opt &operator=(Description_list_opt &&) = default;
};
class Tk_edge : public Node {
public:
  Tk_edge(std::string element);
  Tk_edge(Tk_edge &&) = default;
  Tk_edge &operator=(Tk_edge &&) = default;
};
class Preprocessor_elsif_statements_opt : public Node {
public:
  Preprocessor_elsif_statements_opt(std::string element);
  Preprocessor_elsif_statements_opt(Preprocessor_elsif_statements_opt &&) =
      default;
  Preprocessor_elsif_statements_opt &
  operator=(Preprocessor_elsif_statements_opt &&) = default;
};
class Case_item_expression : public Node {
public:
  Case_item_expression(std::string element);
  Case_item_expression(Case_item_expression &&) = default;
  Case_item_expression &operator=(Case_item_expression &&) = default;
};
class Tk_infinite : public Node {
public:
  Tk_infinite(std::string element);
  Tk_infinite(Tk_infinite &&) = default;
  Tk_infinite &operator=(Tk_infinite &&) = default;
};
class Preprocessor_else_config_rule_statement : public Node {
public:
  Preprocessor_else_config_rule_statement(std::string element);
  Preprocessor_else_config_rule_statement(
      Preprocessor_else_config_rule_statement &&) = default;
  Preprocessor_else_config_rule_statement &
  operator=(Preprocessor_else_config_rule_statement &&) = default;
};
class Tk_nature : public Node {
public:
  Tk_nature(std::string element);
  Tk_nature(Tk_nature &&) = default;
  Tk_nature &operator=(Tk_nature &&) = default;
};
class Tk_analog : public Node {
public:
  Tk_analog(std::string element);
  Tk_analog(Tk_analog &&) = default;
  Tk_analog &operator=(Tk_analog &&) = default;
};
class Tk_macromodule : public Node {
public:
  Tk_macromodule(std::string element);
  Tk_macromodule(Tk_macromodule &&) = default;
  Tk_macromodule &operator=(Tk_macromodule &&) = default;
};
class Tk_s_eventually : public Node {
public:
  Tk_s_eventually(std::string element);
  Tk_s_eventually(Tk_s_eventually &&) = default;
  Tk_s_eventually &operator=(Tk_s_eventually &&) = default;
};
class Tk_srecrem : public Node {
public:
  Tk_srecrem(std::string element);
  Tk_srecrem(Tk_srecrem &&) = default;
  Tk_srecrem &operator=(Tk_srecrem &&) = default;
};
class Tk_null : public Node {
public:
  Tk_null(std::string element);
  Tk_null(Tk_null &&) = default;
  Tk_null &operator=(Tk_null &&) = default;
};
class Tk_lp : public Node {
public:
  Tk_lp(std::string element);
  Tk_lp(Tk_lp &&) = default;
  Tk_lp &operator=(Tk_lp &&) = default;
};
class Preprocessor_else_class_item_opt : public Node {
public:
  Preprocessor_else_class_item_opt(std::string element);
  Preprocessor_else_class_item_opt(Preprocessor_else_class_item_opt &&) =
      default;
  Preprocessor_else_class_item_opt &
  operator=(Preprocessor_else_class_item_opt &&) = default;
};
class Named_parameter_assignment : public Node {
public:
  Named_parameter_assignment(std::string element);
  Named_parameter_assignment(Named_parameter_assignment &&) = default;
  Named_parameter_assignment &
  operator=(Named_parameter_assignment &&) = default;
};
class Tk_min : public Node {
public:
  Tk_min(std::string element);
  Tk_min(Tk_min &&) = default;
  Tk_min &operator=(Tk_min &&) = default;
};
class Tk_unique0 : public Node {
public:
  Tk_unique0(std::string element);
  Tk_unique0(Tk_unique0 &&) = default;
  Tk_unique0 &operator=(Tk_unique0 &&) = default;
};
class Tk_or : public Node {
public:
  Tk_or(std::string element);
  Tk_or(Tk_or &&) = default;
  Tk_or &operator=(Tk_or &&) = default;
};
class Tk_wone : public Node {
public:
  Tk_wone(std::string element);
  Tk_wone(Tk_wone &&) = default;
  Tk_wone &operator=(Tk_wone &&) = default;
};
class Tk_rs : public Node {
public:
  Tk_rs(std::string element);
  Tk_rs(Tk_rs &&) = default;
  Tk_rs &operator=(Tk_rs &&) = default;
};
class Tk_find : public Node {
public:
  Tk_find(std::string element);
  Tk_find(Tk_find &&) = default;
  Tk_find &operator=(Tk_find &&) = default;
};
class Preprocessor_elsif_config_rule_statement : public Node {
public:
  Preprocessor_elsif_config_rule_statement(std::string element);
  Preprocessor_elsif_config_rule_statement(
      Preprocessor_elsif_config_rule_statement &&) = default;
  Preprocessor_elsif_config_rule_statement &
  operator=(Preprocessor_elsif_config_rule_statement &&) = default;
};
class Tk_end : public Node {
public:
  Tk_end(std::string element);
  Tk_end(Tk_end &&) = default;
  Tk_end &operator=(Tk_end &&) = default;
};
class Tk_bind : public Node {
public:
  Tk_bind(std::string element);
  Tk_bind(Tk_bind &&) = default;
  Tk_bind &operator=(Tk_bind &&) = default;
};
class Incdir_spec_opt : public Node {
public:
  Incdir_spec_opt(std::string element);
  Incdir_spec_opt(Incdir_spec_opt &&) = default;
  Incdir_spec_opt &operator=(Incdir_spec_opt &&) = default;
};
class Preprocessor_elsif_constraint_expressions : public Node {
public:
  Preprocessor_elsif_constraint_expressions(std::string element);
  Preprocessor_elsif_constraint_expressions(
      Preprocessor_elsif_constraint_expressions &&) = default;
  Preprocessor_elsif_constraint_expressions &
  operator=(Preprocessor_elsif_constraint_expressions &&) = default;
};
class Preprocessor_else_constraint_expression : public Node {
public:
  Preprocessor_else_constraint_expression(std::string element);
  Preprocessor_else_constraint_expression(
      Preprocessor_else_constraint_expression &&) = default;
  Preprocessor_else_constraint_expression &
  operator=(Preprocessor_else_constraint_expression &&) = default;
};
class Tk_continue : public Node {
public:
  Tk_continue(std::string element);
  Tk_continue(Tk_continue &&) = default;
  Tk_continue &operator=(Tk_continue &&) = default;
};
class Tk_cross : public Node {
public:
  Tk_cross(std::string element);
  Tk_cross(Tk_cross &&) = default;
  Tk_cross &operator=(Tk_cross &&) = default;
};
class Dr_timescale : public Node {
public:
  Dr_timescale(std::string element);
  Dr_timescale(Dr_timescale &&) = default;
  Dr_timescale &operator=(Dr_timescale &&) = default;
};
class Preprocessor_elsif_constraint_block_item : public Node {
public:
  Preprocessor_elsif_constraint_block_item(std::string element);
  Preprocessor_elsif_constraint_block_item(
      Preprocessor_elsif_constraint_block_item &&) = default;
  Preprocessor_elsif_constraint_block_item &
  operator=(Preprocessor_elsif_constraint_block_item &&) = default;
};
class Tk_alias : public Node {
public:
  Tk_alias(std::string element);
  Tk_alias(Tk_alias &&) = default;
  Tk_alias &operator=(Tk_alias &&) = default;
};
class Preprocessor_balanced_constraint_expressions : public Node {
public:
  Preprocessor_balanced_constraint_expressions(std::string element);
  Preprocessor_balanced_constraint_expressions(
      Preprocessor_balanced_constraint_expressions &&) = default;
  Preprocessor_balanced_constraint_expressions &
  operator=(Preprocessor_balanced_constraint_expressions &&) = default;
};
class Tk_integer : public Node {
public:
  Tk_integer(std::string element);
  Tk_integer(Tk_integer &&) = default;
  Tk_integer &operator=(Tk_integer &&) = default;
};
class Tk_join_any : public Node {
public:
  Tk_join_any(std::string element);
  Tk_join_any(Tk_join_any &&) = default;
  Tk_join_any &operator=(Tk_join_any &&) = default;
};
class Tk_interface : public Node {
public:
  Tk_interface(std::string element);
  Tk_interface(Tk_interface &&) = default;
  Tk_interface &operator=(Tk_interface &&) = default;
};
class Tf_port_list_preprocessor_last : public Node {
public:
  Tf_port_list_preprocessor_last(std::string element);
  Tf_port_list_preprocessor_last(Tf_port_list_preprocessor_last &&) = default;
  Tf_port_list_preprocessor_last &
  operator=(Tf_port_list_preprocessor_last &&) = default;
};
class Tk_export : public Node {
public:
  Tk_export(std::string element);
  Tk_export(Tk_export &&) = default;
  Tk_export &operator=(Tk_export &&) = default;
};
class Preprocessor_elsif_statement : public Node {
public:
  Preprocessor_elsif_statement(std::string element);
  Preprocessor_elsif_statement(Preprocessor_elsif_statement &&) = default;
  Preprocessor_elsif_statement &
  operator=(Preprocessor_elsif_statement &&) = default;
};
class Preprocessor_else_config_rule_statement_opt : public Node {
public:
  Preprocessor_else_config_rule_statement_opt(std::string element);
  Preprocessor_else_config_rule_statement_opt(
      Preprocessor_else_config_rule_statement_opt &&) = default;
  Preprocessor_else_config_rule_statement_opt &
  operator=(Preprocessor_else_config_rule_statement_opt &&) = default;
};
class Tk_nxor : public Node {
public:
  Tk_nxor(std::string element);
  Tk_nxor(Tk_nxor &&) = default;
  Tk_nxor &operator=(Tk_nxor &&) = default;
};
class Preprocessor_elsif_generate_items_opt : public Node {
public:
  Preprocessor_elsif_generate_items_opt(std::string element);
  Preprocessor_elsif_generate_items_opt(
      Preprocessor_elsif_generate_items_opt &&) = default;
  Preprocessor_elsif_generate_items_opt &
  operator=(Preprocessor_elsif_generate_items_opt &&) = default;
};
class Tk_supply0 : public Node {
public:
  Tk_supply0(std::string element);
  Tk_supply0(Tk_supply0 &&) = default;
  Tk_supply0 &operator=(Tk_supply0 &&) = default;
};
class Tk_s_always : public Node {
public:
  Tk_s_always(std::string element);
  Tk_s_always(Tk_s_always &&) = default;
  Tk_s_always &operator=(Tk_s_always &&) = default;
};
class Tk_reg : public Node {
public:
  Tk_reg(std::string element);
  Tk_reg(Tk_reg &&) = default;
  Tk_reg &operator=(Tk_reg &&) = default;
};
class File_path_spec : public Node {
public:
  File_path_spec(std::string element);
  File_path_spec(File_path_spec &&) = default;
  File_path_spec &operator=(File_path_spec &&) = default;
};
class Dr_endcelldefine : public Node {
public:
  Dr_endcelldefine(std::string element);
  Dr_endcelldefine(Dr_endcelldefine &&) = default;
  Dr_endcelldefine &operator=(Dr_endcelldefine &&) = default;
};
class Preprocessor_list_of_ports_or_port_declarations_opt : public Node {
public:
  Preprocessor_list_of_ports_or_port_declarations_opt(std::string element);
  Preprocessor_list_of_ports_or_port_declarations_opt(
      Preprocessor_list_of_ports_or_port_declarations_opt &&) = default;
  Preprocessor_list_of_ports_or_port_declarations_opt &
  operator=(Preprocessor_list_of_ports_or_port_declarations_opt &&) = default;
};
class Tk_implies : public Node {
public:
  Tk_implies(std::string element);
  Tk_implies(Tk_implies &&) = default;
  Tk_implies &operator=(Tk_implies &&) = default;
};
class Tk_first_match : public Node {
public:
  Tk_first_match(std::string element);
  Tk_first_match(Tk_first_match &&) = default;
  Tk_first_match &operator=(Tk_first_match &&) = default;
};
class Preprocessor_elsif_package_items : public Node {
public:
  Preprocessor_elsif_package_items(std::string element);
  Preprocessor_elsif_package_items(Preprocessor_elsif_package_items &&) =
      default;
  Preprocessor_elsif_package_items &
  operator=(Preprocessor_elsif_package_items &&) = default;
};
class Tk_pmos : public Node {
public:
  Tk_pmos(std::string element);
  Tk_pmos(Tk_pmos &&) = default;
  Tk_pmos &operator=(Tk_pmos &&) = default;
};
class Preprocessor_balanced_module_items : public Node {
public:
  Preprocessor_balanced_module_items(std::string element);
  Preprocessor_balanced_module_items(Preprocessor_balanced_module_items &&) =
      default;
  Preprocessor_balanced_module_items &
  operator=(Preprocessor_balanced_module_items &&) = default;
};
class Block_event_expr_primary : public Node {
public:
  Block_event_expr_primary(std::string element);
  Block_event_expr_primary(Block_event_expr_primary &&) = default;
  Block_event_expr_primary &operator=(Block_event_expr_primary &&) = default;
};
class Constraint_prototype : public Node {
public:
  Constraint_prototype(std::string element);
  Constraint_prototype(Constraint_prototype &&) = default;
  Constraint_prototype &operator=(Constraint_prototype &&) = default;
};
class Tk_ls : public Node {
public:
  Tk_ls(std::string element);
  Tk_ls(Tk_ls &&) = default;
  Tk_ls &operator=(Tk_ls &&) = default;
};
class Tk_cell : public Node {
public:
  Tk_cell(std::string element);
  Tk_cell(Tk_cell &&) = default;
  Tk_cell &operator=(Tk_cell &&) = default;
};
class Tk_weak0 : public Node {
public:
  Tk_weak0(std::string element);
  Tk_weak0(Tk_weak0 &&) = default;
  Tk_weak0 &operator=(Tk_weak0 &&) = default;
};
class Dr_enable_portfaults : public Node {
public:
  Dr_enable_portfaults(std::string element);
  Dr_enable_portfaults(Dr_enable_portfaults &&) = default;
  Dr_enable_portfaults &operator=(Dr_enable_portfaults &&) = default;
};
class Tk_noshowcancelled : public Node {
public:
  Tk_noshowcancelled(std::string element);
  Tk_noshowcancelled(Tk_noshowcancelled &&) = default;
  Tk_noshowcancelled &operator=(Tk_noshowcancelled &&) = default;
};
class Tk_not : public Node {
public:
  Tk_not(std::string element);
  Tk_not(Tk_not &&) = default;
  Tk_not &operator=(Tk_not &&) = default;
};
class Preprocessor_else_bins_or_options : public Node {
public:
  Preprocessor_else_bins_or_options(std::string element);
  Preprocessor_else_bins_or_options(Preprocessor_else_bins_or_options &&) =
      default;
  Preprocessor_else_bins_or_options &
  operator=(Preprocessor_else_bins_or_options &&) = default;
};
class Tk_cover : public Node {
public:
  Tk_cover(std::string element);
  Tk_cover(Tk_cover &&) = default;
  Tk_cover &operator=(Tk_cover &&) = default;
};
class Preprocessor_control_flow : public Node {
public:
  Preprocessor_control_flow(std::string element);
  Preprocessor_control_flow(Preprocessor_control_flow &&) = default;
  Preprocessor_control_flow &operator=(Preprocessor_control_flow &&) = default;
};
class Tk_output : public Node {
public:
  Tk_output(std::string element);
  Tk_output(Tk_output &&) = default;
  Tk_output &operator=(Tk_output &&) = default;
};
class Tk_tri1 : public Node {
public:
  Tk_tri1(std::string element);
  Tk_tri1(Tk_tri1 &&) = default;
  Tk_tri1 &operator=(Tk_tri1 &&) = default;
};
class Tk_dotstar : public Node {
public:
  Tk_dotstar(std::string element);
  Tk_dotstar(Tk_dotstar &&) = default;
  Tk_dotstar &operator=(Tk_dotstar &&) = default;
};
class Tk_timeunit : public Node {
public:
  Tk_timeunit(std::string element);
  Tk_timeunit(Tk_timeunit &&) = default;
  Tk_timeunit &operator=(Tk_timeunit &&) = default;
};
class Tk_tri : public Node {
public:
  Tk_tri(std::string element);
  Tk_tri(Tk_tri &&) = default;
  Tk_tri &operator=(Tk_tri &&) = default;
};
class Macrocall : public Node {
public:
  Macrocall(std::string element);
  Macrocall(Macrocall &&) = default;
  Macrocall &operator=(Macrocall &&) = default;
};
class Tk_inout : public Node {
public:
  Tk_inout(std::string element);
  Tk_inout(Tk_inout &&) = default;
  Tk_inout &operator=(Tk_inout &&) = default;
};
class Tk_casex : public Node {
public:
  Tk_casex(std::string element);
  Tk_casex(Tk_casex &&) = default;
  Tk_casex &operator=(Tk_casex &&) = default;
};
class Tk_potential : public Node {
public:
  Tk_potential(std::string element);
  Tk_potential(Tk_potential &&) = default;
  Tk_potential &operator=(Tk_potential &&) = default;
};
class Tk_poundeqpound : public Node {
public:
  Tk_poundeqpound(std::string element);
  Tk_poundeqpound(Tk_poundeqpound &&) = default;
  Tk_poundeqpound &operator=(Tk_poundeqpound &&) = default;
};
class Tk_let : public Node {
public:
  Tk_let(std::string element);
  Tk_let(Tk_let &&) = default;
  Tk_let &operator=(Tk_let &&) = default;
};
class Dr_default_nettype : public Node {
public:
  Dr_default_nettype(std::string element);
  Dr_default_nettype(Dr_default_nettype &&) = default;
  Dr_default_nettype &operator=(Dr_default_nettype &&) = default;
};
class Tk_begin : public Node {
public:
  Tk_begin(std::string element);
  Tk_begin(Tk_begin &&) = default;
  Tk_begin &operator=(Tk_begin &&) = default;
};
class Tk_casez : public Node {
public:
  Tk_casez(std::string element);
  Tk_casez(Tk_casez &&) = default;
  Tk_casez &operator=(Tk_casez &&) = default;
};
class Tk_nettype : public Node {
public:
  Tk_nettype(std::string element);
  Tk_nettype(Tk_nettype &&) = default;
  Tk_nettype &operator=(Tk_nettype &&) = default;
};
class Tk_pull0 : public Node {
public:
  Tk_pull0(std::string element);
  Tk_pull0(Tk_pull0 &&) = default;
  Tk_pull0 &operator=(Tk_pull0 &&) = default;
};
class Tk_illegal_bins : public Node {
public:
  Tk_illegal_bins(std::string element);
  Tk_illegal_bins(Tk_illegal_bins &&) = default;
  Tk_illegal_bins &operator=(Tk_illegal_bins &&) = default;
};
class Decay_value_simple : public Node {
public:
  Decay_value_simple(std::string element);
  Decay_value_simple(Decay_value_simple &&) = default;
  Decay_value_simple &operator=(Decay_value_simple &&) = default;
};
class Tk_enum : public Node {
public:
  Tk_enum(std::string element);
  Tk_enum(Tk_enum &&) = default;
  Tk_enum &operator=(Tk_enum &&) = default;
};
class Tk_wor : public Node {
public:
  Tk_wor(std::string element);
  Tk_wor(Tk_wor &&) = default;
  Tk_wor &operator=(Tk_wor &&) = default;
};
class Tk_inf : public Node {
public:
  Tk_inf(std::string element);
  Tk_inf(Tk_inf &&) = default;
  Tk_inf &operator=(Tk_inf &&) = default;
};
class Tk_sroot : public Node {
public:
  Tk_sroot(std::string element);
  Tk_sroot(Tk_sroot &&) = default;
  Tk_sroot &operator=(Tk_sroot &&) = default;
};
class Tk_interconnect : public Node {
public:
  Tk_interconnect(std::string element);
  Tk_interconnect(Tk_interconnect &&) = default;
  Tk_interconnect &operator=(Tk_interconnect &&) = default;
};
class Preprocessor_balanced_package_items : public Node {
public:
  Preprocessor_balanced_package_items(std::string element);
  Preprocessor_balanced_package_items(Preprocessor_balanced_package_items &&) =
      default;
  Preprocessor_balanced_package_items &
  operator=(Preprocessor_balanced_package_items &&) = default;
};
class Tk_shortint : public Node {
public:
  Tk_shortint(std::string element);
  Tk_shortint(Tk_shortint &&) = default;
  Tk_shortint &operator=(Tk_shortint &&) = default;
};
class Tk_struct : public Node {
public:
  Tk_struct(std::string element);
  Tk_struct(Tk_struct &&) = default;
  Tk_struct &operator=(Tk_struct &&) = default;
};
class Tk_break : public Node {
public:
  Tk_break(std::string element);
  Tk_break(Tk_break &&) = default;
  Tk_break &operator=(Tk_break &&) = default;
};
class Tk_nmos : public Node {
public:
  Tk_nmos(std::string element);
  Tk_nmos(Tk_nmos &&) = default;
  Tk_nmos &operator=(Tk_nmos &&) = default;
};
class Tk_string : public Node {
public:
  Tk_string(std::string element);
  Tk_string(Tk_string &&) = default;
  Tk_string &operator=(Tk_string &&) = default;
};
class Tk_sync_reject_on : public Node {
public:
  Tk_sync_reject_on(std::string element);
  Tk_sync_reject_on(Tk_sync_reject_on &&) = default;
  Tk_sync_reject_on &operator=(Tk_sync_reject_on &&) = default;
};
class Tk_wire : public Node {
public:
  Tk_wire(std::string element);
  Tk_wire(Tk_wire &&) = default;
  Tk_wire &operator=(Tk_wire &&) = default;
};
class Tk_po_pos : public Node {
public:
  Tk_po_pos(std::string element);
  Tk_po_pos(Tk_po_pos &&) = default;
  Tk_po_pos &operator=(Tk_po_pos &&) = default;
};
class Tk_return : public Node {
public:
  Tk_return(std::string element);
  Tk_return(Tk_return &&) = default;
  Tk_return &operator=(Tk_return &&) = default;
};
class Tk_pipearrow : public Node {
public:
  Tk_pipearrow(std::string element);
  Tk_pipearrow(Tk_pipearrow &&) = default;
  Tk_pipearrow &operator=(Tk_pipearrow &&) = default;
};
class Preprocessor_else_description_item_opt : public Node {
public:
  Preprocessor_else_description_item_opt(std::string element);
  Preprocessor_else_description_item_opt(
      Preprocessor_else_description_item_opt &&) = default;
  Preprocessor_else_description_item_opt &
  operator=(Preprocessor_else_description_item_opt &&) = default;
};
class Dr_protect : public Node {
public:
  Dr_protect(std::string element);
  Dr_protect(Dr_protect &&) = default;
  Dr_protect &operator=(Dr_protect &&) = default;
};
class Macrocallitem : public Node {
public:
  Macrocallitem(std::string element);
  Macrocallitem(Macrocallitem &&) = default;
  Macrocallitem &operator=(Macrocallitem &&) = default;
};
class Tk_domain : public Node {
public:
  Tk_domain(std::string element);
  Tk_domain(Tk_domain &&) = default;
  Tk_domain &operator=(Tk_domain &&) = default;
};
class Tk_stimeskew : public Node {
public:
  Tk_stimeskew(std::string element);
  Tk_stimeskew(Tk_stimeskew &&) = default;
  Tk_stimeskew &operator=(Tk_stimeskew &&) = default;
};
class Macroarg : public Node {
public:
  Macroarg(std::string element);
  Macroarg(Macroarg &&) = default;
  Macroarg &operator=(Macroarg &&) = default;
};
class Tk_timeprecision_check : public Node {
public:
  Tk_timeprecision_check(std::string element);
  Tk_timeprecision_check(Tk_timeprecision_check &&) = default;
  Tk_timeprecision_check &operator=(Tk_timeprecision_check &&) = default;
};
class Tk_bins : public Node {
public:
  Tk_bins(std::string element);
  Tk_bins(Tk_bins &&) = default;
  Tk_bins &operator=(Tk_bins &&) = default;
};
class Tk_deassign : public Node {
public:
  Tk_deassign(std::string element);
  Tk_deassign(Tk_deassign &&) = default;
  Tk_deassign &operator=(Tk_deassign &&) = default;
};
class Tk_nor : public Node {
public:
  Tk_nor(std::string element);
  Tk_nor(Tk_nor &&) = default;
  Tk_nor &operator=(Tk_nor &&) = default;
};
class Tk_packed : public Node {
public:
  Tk_packed(std::string element);
  Tk_packed(Tk_packed &&) = default;
  Tk_packed &operator=(Tk_packed &&) = default;
};
class Preprocessor_else_port_declarations_opt : public Node {
public:
  Preprocessor_else_port_declarations_opt(std::string element);
  Preprocessor_else_port_declarations_opt(
      Preprocessor_else_port_declarations_opt &&) = default;
  Preprocessor_else_port_declarations_opt &
  operator=(Preprocessor_else_port_declarations_opt &&) = default;
};
class Tk_primitive : public Node {
public:
  Tk_primitive(std::string element);
  Tk_primitive(Tk_primitive &&) = default;
  Tk_primitive &operator=(Tk_primitive &&) = default;
};
class Tk_nand : public Node {
public:
  Tk_nand(std::string element);
  Tk_nand(Tk_nand &&) = default;
  Tk_nand &operator=(Tk_nand &&) = default;
};
class Preprocessor_else_constraint_block_item : public Node {
public:
  Preprocessor_else_constraint_block_item(std::string element);
  Preprocessor_else_constraint_block_item(
      Preprocessor_else_constraint_block_item &&) = default;
  Preprocessor_else_constraint_block_item &
  operator=(Preprocessor_else_constraint_block_item &&) = default;
};
class Tk_priority : public Node {
public:
  Tk_priority(std::string element);
  Tk_priority(Tk_priority &&) = default;
  Tk_priority &operator=(Tk_priority &&) = default;
};
class Nature_declaration : public Node {
public:
  Nature_declaration(std::string element);
  Nature_declaration(Nature_declaration &&) = default;
  Nature_declaration &operator=(Nature_declaration &&) = default;
};
class Preprocessor_elsif_config_rule_statements : public Node {
public:
  Preprocessor_elsif_config_rule_statements(std::string element);
  Preprocessor_elsif_config_rule_statements(
      Preprocessor_elsif_config_rule_statements &&) = default;
  Preprocessor_elsif_config_rule_statements &
  operator=(Preprocessor_elsif_config_rule_statements &&) = default;
};
class Dr_celldefine : public Node {
public:
  Dr_celldefine(std::string element);
  Dr_celldefine(Dr_celldefine &&) = default;
  Dr_celldefine &operator=(Dr_celldefine &&) = default;
};
class Tk_accept_on : public Node {
public:
  Tk_accept_on(std::string element);
  Tk_accept_on(Tk_accept_on &&) = default;
  Tk_accept_on &operator=(Tk_accept_on &&) = default;
};
class Tk_swidth : public Node {
public:
  Tk_swidth(std::string element);
  Tk_swidth(Tk_swidth &&) = default;
  Tk_swidth &operator=(Tk_swidth &&) = default;
};
class Tk_byte : public Node {
public:
  Tk_byte(std::string element);
  Tk_byte(Tk_byte &&) = default;
  Tk_byte &operator=(Tk_byte &&) = default;
};
class Tk_lbplusrb : public Node {
public:
  Tk_lbplusrb(std::string element);
  Tk_lbplusrb(Tk_lbplusrb &&) = default;
  Tk_lbplusrb &operator=(Tk_lbplusrb &&) = default;
};
class Tk_randsequence : public Node {
public:
  Tk_randsequence(std::string element);
  Tk_randsequence(Tk_randsequence &&) = default;
  Tk_randsequence &operator=(Tk_randsequence &&) = default;
};
class Tk_dist : public Node {
public:
  Tk_dist(std::string element);
  Tk_dist(Tk_dist &&) = default;
  Tk_dist &operator=(Tk_dist &&) = default;
};
class Preprocessor_elsif_generate_item : public Node {
public:
  Preprocessor_elsif_generate_item(std::string element);
  Preprocessor_elsif_generate_item(Preprocessor_elsif_generate_item &&) =
      default;
  Preprocessor_elsif_generate_item &
  operator=(Preprocessor_elsif_generate_item &&) = default;
};
class Tk_continuous : public Node {
public:
  Tk_continuous(std::string element);
  Tk_continuous(Tk_continuous &&) = default;
  Tk_continuous &operator=(Tk_continuous &&) = default;
};
class Macrocallid : public Node {
public:
  Macrocallid(std::string element);
  Macrocallid(Macrocallid &&) = default;
  Macrocallid &operator=(Macrocallid &&) = default;
};
class Dr_nosuppress_faults : public Node {
public:
  Dr_nosuppress_faults(std::string element);
  Dr_nosuppress_faults(Dr_nosuppress_faults &&) = default;
  Dr_nosuppress_faults &operator=(Dr_nosuppress_faults &&) = default;
};
class Tk_defparam : public Node {
public:
  Tk_defparam(std::string element);
  Tk_defparam(Tk_defparam &&) = default;
  Tk_defparam &operator=(Tk_defparam &&) = default;
};
class Preprocessor_elsif_package_item : public Node {
public:
  Preprocessor_elsif_package_item(std::string element);
  Preprocessor_elsif_package_item(Preprocessor_elsif_package_item &&) = default;
  Preprocessor_elsif_package_item &
  operator=(Preprocessor_elsif_package_item &&) = default;
};
class Case_item_expression_list : public Node {
public:
  Case_item_expression_list(std::string element);
  Case_item_expression_list(Case_item_expression_list &&) = default;
  Case_item_expression_list &operator=(Case_item_expression_list &&) = default;
};
class Class_item_qualifier_list : public Node {
public:
  Class_item_qualifier_list(std::string element);
  Class_item_qualifier_list(Class_item_qualifier_list &&) = default;
  Class_item_qualifier_list &operator=(Class_item_qualifier_list &&) = default;
};
class Tk_assert : public Node {
public:
  Tk_assert(std::string element);
  Tk_assert(Tk_assert &&) = default;
  Tk_assert &operator=(Tk_assert &&) = default;
};
class Tk_default : public Node {
public:
  Tk_default(std::string element);
  Tk_default(Tk_default &&) = default;
  Tk_default &operator=(Tk_default &&) = default;
};
class Pp_undef : public Node {
public:
  Pp_undef(std::string element);
  Pp_undef(Pp_undef &&) = default;
  Pp_undef &operator=(Pp_undef &&) = default;
};
class Pp_endif : public Node {
public:
  Pp_endif(std::string element);
  Pp_endif(Pp_endif &&) = default;
  Pp_endif &operator=(Pp_endif &&) = default;
};
class Tk_protected : public Node {
public:
  Tk_protected(std::string element);
  Tk_protected(Tk_protected &&) = default;
  Tk_protected &operator=(Tk_protected &&) = default;
};
class Preprocessor_elsif_constraint_expression : public Node {
public:
  Preprocessor_elsif_constraint_expression(std::string element);
  Preprocessor_elsif_constraint_expression(
      Preprocessor_elsif_constraint_expression &&) = default;
  Preprocessor_elsif_constraint_expression &
  operator=(Preprocessor_elsif_constraint_expression &&) = default;
};
class Value_range_expression : public Node {
public:
  Value_range_expression(std::string element);
  Value_range_expression(Value_range_expression &&) = default;
  Value_range_expression &operator=(Value_range_expression &&) = default;
};
class Dr_default_decay_time : public Node {
public:
  Dr_default_decay_time(std::string element);
  Dr_default_decay_time(Dr_default_decay_time &&) = default;
  Dr_default_decay_time &operator=(Dr_default_decay_time &&) = default;
};
class Tk_library : public Node {
public:
  Tk_library(std::string element);
  Tk_library(Tk_library &&) = default;
  Tk_library &operator=(Tk_library &&) = default;
};
class Tk_local : public Node {
public:
  Tk_local(std::string element);
  Tk_local(Tk_local &&) = default;
  Tk_local &operator=(Tk_local &&) = default;
};
class Tk_untyped : public Node {
public:
  Tk_untyped(std::string element);
  Tk_untyped(Tk_untyped &&) = default;
  Tk_untyped &operator=(Tk_untyped &&) = default;
};
class Tk_unique : public Node {
public:
  Tk_unique(std::string element);
  Tk_unique(Tk_unique &&) = default;
  Tk_unique &operator=(Tk_unique &&) = default;
};
class Tk_ssetuphold : public Node {
public:
  Tk_ssetuphold(std::string element);
  Tk_ssetuphold(Tk_ssetuphold &&) = default;
  Tk_ssetuphold &operator=(Tk_ssetuphold &&) = default;
};
class Tk_use : public Node {
public:
  Tk_use(std::string element);
  Tk_use(Tk_use &&) = default;
  Tk_use &operator=(Tk_use &&) = default;
};
class Preprocessor_else_module_item : public Node {
public:
  Preprocessor_else_module_item(std::string element);
  Preprocessor_else_module_item(Preprocessor_else_module_item &&) = default;
  Preprocessor_else_module_item &
  operator=(Preprocessor_else_module_item &&) = default;
};
class List_of_ports_or_port_declarations_preprocessor_last_non_ansi
    : public Node {
public:
  List_of_ports_or_port_declarations_preprocessor_last_non_ansi(
      std::string element);
  List_of_ports_or_port_declarations_preprocessor_last_non_ansi(
      List_of_ports_or_port_declarations_preprocessor_last_non_ansi &&) =
      default;
  List_of_ports_or_port_declarations_preprocessor_last_non_ansi &
  operator=(List_of_ports_or_port_declarations_preprocessor_last_non_ansi &&) =
      default;
};
class Tk_sfullskew : public Node {
public:
  Tk_sfullskew(std::string element);
  Tk_sfullskew(Tk_sfullskew &&) = default;
  Tk_sfullskew &operator=(Tk_sfullskew &&) = default;
};
class Tk_buf : public Node {
public:
  Tk_buf(std::string element);
  Tk_buf(Tk_buf &&) = default;
  Tk_buf &operator=(Tk_buf &&) = default;
};
class Tk_property : public Node {
public:
  Tk_property(std::string element);
  Tk_property(Tk_property &&) = default;
  Tk_property &operator=(Tk_property &&) = default;
};
class Tk_pull1 : public Node {
public:
  Tk_pull1(std::string element);
  Tk_pull1(Tk_pull1 &&) = default;
  Tk_pull1 &operator=(Tk_pull1 &&) = default;
};
class Tk_speriod : public Node {
public:
  Tk_speriod(std::string element);
  Tk_speriod(Tk_speriod &&) = default;
  Tk_speriod &operator=(Tk_speriod &&) = default;
};
class Preprocessor_else_constraint_expression_opt : public Node {
public:
  Preprocessor_else_constraint_expression_opt(std::string element);
  Preprocessor_else_constraint_expression_opt(
      Preprocessor_else_constraint_expression_opt &&) = default;
  Preprocessor_else_constraint_expression_opt &
  operator=(Preprocessor_else_constraint_expression_opt &&) = default;
};
class Select_dimensions : public Node {
public:
  Select_dimensions(std::string element);
  Select_dimensions(Select_dimensions &&) = default;
  Select_dimensions &operator=(Select_dimensions &&) = default;
};
class Preprocessor_elsif_module_items_opt : public Node {
public:
  Preprocessor_elsif_module_items_opt(std::string element);
  Preprocessor_elsif_module_items_opt(Preprocessor_elsif_module_items_opt &&) =
      default;
  Preprocessor_elsif_module_items_opt &
  operator=(Preprocessor_elsif_module_items_opt &&) = default;
};
class Tk_timeunit_check : public Node {
public:
  Tk_timeunit_check(std::string element);
  Tk_timeunit_check(Tk_timeunit_check &&) = default;
  Tk_timeunit_check &operator=(Tk_timeunit_check &&) = default;
};
class Parameter_value_range : public Node {
public:
  Parameter_value_range(std::string element);
  Parameter_value_range(Parameter_value_range &&) = default;
  Parameter_value_range &operator=(Parameter_value_range &&) = default;
};
class Tk_extends : public Node {
public:
  Tk_extends(std::string element);
  Tk_extends(Tk_extends &&) = default;
  Tk_extends &operator=(Tk_extends &&) = default;
};
class Tk_trior : public Node {
public:
  Tk_trior(std::string element);
  Tk_trior(Tk_trior &&) = default;
  Tk_trior &operator=(Tk_trior &&) = default;
};
class Tk_s_until : public Node {
public:
  Tk_s_until(std::string element);
  Tk_s_until(Tk_s_until &&) = default;
  Tk_s_until &operator=(Tk_s_until &&) = default;
};
class Library_declaration : public Node {
public:
  Library_declaration(std::string element);
  Library_declaration(Library_declaration &&) = default;
  Library_declaration &operator=(Library_declaration &&) = default;
};
class Tk_rsort : public Node {
public:
  Tk_rsort(std::string element);
  Tk_rsort(Tk_rsort &&) = default;
  Tk_rsort &operator=(Tk_rsort &&) = default;
};
class Tk_posedge : public Node {
public:
  Tk_posedge(std::string element);
  Tk_posedge(Tk_posedge &&) = default;
  Tk_posedge &operator=(Tk_posedge &&) = default;
};
class Tk_generate : public Node {
public:
  Tk_generate(std::string element);
  Tk_generate(Tk_generate &&) = default;
  Tk_generate &operator=(Tk_generate &&) = default;
};
class Tk_design : public Node {
public:
  Tk_design(std::string element);
  Tk_design(Tk_design &&) = default;
  Tk_design &operator=(Tk_design &&) = default;
};
class Tk_always_comb : public Node {
public:
  Tk_always_comb(std::string element);
  Tk_always_comb(Tk_always_comb &&) = default;
  Tk_always_comb &operator=(Tk_always_comb &&) = default;
};
class Library_description_list : public Node {
public:
  Library_description_list(std::string element);
  Library_description_list(Library_description_list &&) = default;
  Library_description_list &operator=(Library_description_list &&) = default;
};
class Preprocessor_else_generate_item : public Node {
public:
  Preprocessor_else_generate_item(std::string element);
  Preprocessor_else_generate_item(Preprocessor_else_generate_item &&) = default;
  Preprocessor_else_generate_item &
  operator=(Preprocessor_else_generate_item &&) = default;
};
class Tk_tri0 : public Node {
public:
  Tk_tri0(std::string element);
  Tk_tri0(Tk_tri0 &&) = default;
  Tk_tri0 &operator=(Tk_tri0 &&) = default;
};
class Preprocessor_balanced_statements : public Node {
public:
  Preprocessor_balanced_statements(std::string element);
  Preprocessor_balanced_statements(Preprocessor_balanced_statements &&) =
      default;
  Preprocessor_balanced_statements &
  operator=(Preprocessor_balanced_statements &&) = default;
};
class Tk_real : public Node {
public:
  Tk_real(std::string element);
  Tk_real(Tk_real &&) = default;
  Tk_real &operator=(Tk_real &&) = default;
};
class Tk_from : public Node {
public:
  Tk_from(std::string element);
  Tk_from(Tk_from &&) = default;
  Tk_from &operator=(Tk_from &&) = default;
};
class Dr_delay_mode_path : public Node {
public:
  Dr_delay_mode_path(std::string element);
  Dr_delay_mode_path(Dr_delay_mode_path &&) = default;
  Dr_delay_mode_path &operator=(Dr_delay_mode_path &&) = default;
};
class Tk_randomize : public Node {
public:
  Tk_randomize(std::string element);
  Tk_randomize(Tk_randomize &&) = default;
  Tk_randomize &operator=(Tk_randomize &&) = default;
};
class Tk_and : public Node {
public:
  Tk_and(std::string element);
  Tk_and(Tk_and &&) = default;
  Tk_and &operator=(Tk_and &&) = default;
};
class Tk_logic : public Node {
public:
  Tk_logic(std::string element);
  Tk_logic(Tk_logic &&) = default;
  Tk_logic &operator=(Tk_logic &&) = default;
};
class Tk_ddt_nature : public Node {
public:
  Tk_ddt_nature(std::string element);
  Tk_ddt_nature(Tk_ddt_nature &&) = default;
  Tk_ddt_nature &operator=(Tk_ddt_nature &&) = default;
};
class Preprocessor_elsif_bins_or_options : public Node {
public:
  Preprocessor_elsif_bins_or_options(std::string element);
  Preprocessor_elsif_bins_or_options(Preprocessor_elsif_bins_or_options &&) =
      default;
  Preprocessor_elsif_bins_or_options &
  operator=(Preprocessor_elsif_bins_or_options &&) = default;
};
class Constraint_expression_list_opt : public Node {
public:
  Constraint_expression_list_opt(std::string element);
  Constraint_expression_list_opt(Constraint_expression_list_opt &&) = default;
  Constraint_expression_list_opt &
  operator=(Constraint_expression_list_opt &&) = default;
};
class Declaration_extends_list : public Node {
public:
  Declaration_extends_list(std::string element);
  Declaration_extends_list(Declaration_extends_list &&) = default;
  Declaration_extends_list &operator=(Declaration_extends_list &&) = default;
};
class Pp_include : public Node {
public:
  Pp_include(std::string element);
  Pp_include(Pp_include &&) = default;
  Pp_include &operator=(Pp_include &&) = default;
};
class Tk_super : public Node {
public:
  Tk_super(std::string element);
  Tk_super(Tk_super &&) = default;
  Tk_super &operator=(Tk_super &&) = default;
};
class Preprocessor_elsif_constraint_block_items : public Node {
public:
  Preprocessor_elsif_constraint_block_items(std::string element);
  Preprocessor_elsif_constraint_block_items(
      Preprocessor_elsif_constraint_block_items &&) = default;
  Preprocessor_elsif_constraint_block_items &
  operator=(Preprocessor_elsif_constraint_block_items &&) = default;
};
class Preprocessor_elsif_class_items_opt : public Node {
public:
  Preprocessor_elsif_class_items_opt(std::string element);
  Preprocessor_elsif_class_items_opt(Preprocessor_elsif_class_items_opt &&) =
      default;
  Preprocessor_elsif_class_items_opt &
  operator=(Preprocessor_elsif_class_items_opt &&) = default;
};
class Tk_poundminuspound : public Node {
public:
  Tk_poundminuspound(std::string element);
  Tk_poundminuspound(Tk_poundminuspound &&) = default;
  Tk_poundminuspound &operator=(Tk_poundminuspound &&) = default;
};
class Tk_reject_on : public Node {
public:
  Tk_reject_on(std::string element);
  Tk_reject_on(Tk_reject_on &&) = default;
  Tk_reject_on &operator=(Tk_reject_on &&) = default;
};
class Tk_function : public Node {
public:
  Tk_function(std::string element);
  Tk_function(Tk_function &&) = default;
  Tk_function &operator=(Tk_function &&) = default;
};
class Tk_sunit : public Node {
public:
  Tk_sunit(std::string element);
  Tk_sunit(Tk_sunit &&) = default;
  Tk_sunit &operator=(Tk_sunit &&) = default;
};
class Tk_restrict : public Node {
public:
  Tk_restrict(std::string element);
  Tk_restrict(Tk_restrict &&) = default;
  Tk_restrict &operator=(Tk_restrict &&) = default;
};
class Tk_task : public Node {
public:
  Tk_task(std::string element);
  Tk_task(Tk_task &&) = default;
  Tk_task &operator=(Tk_task &&) = default;
};
class Tk_find_last : public Node {
public:
  Tk_find_last(std::string element);
  Tk_find_last(Tk_find_last &&) = default;
  Tk_find_last &operator=(Tk_find_last &&) = default;
};
class Tk_sremoval : public Node {
public:
  Tk_sremoval(std::string element);
  Tk_sremoval(Tk_sremoval &&) = default;
  Tk_sremoval &operator=(Tk_sremoval &&) = default;
};
class Tk_longint : public Node {
public:
  Tk_longint(std::string element);
  Tk_longint(Tk_longint &&) = default;
  Tk_longint &operator=(Tk_longint &&) = default;
};
class Tk_type : public Node {
public:
  Tk_type(std::string element);
  Tk_type(Tk_type &&) = default;
  Tk_type &operator=(Tk_type &&) = default;
};
class Pd_library_syntax_begin : public Node {
public:
  Pd_library_syntax_begin(std::string element);
  Pd_library_syntax_begin(Pd_library_syntax_begin &&) = default;
  Pd_library_syntax_begin &operator=(Pd_library_syntax_begin &&) = default;
};
class Tk_find_index : public Node {
public:
  Tk_find_index(std::string element);
  Tk_find_index(Tk_find_index &&) = default;
  Tk_find_index &operator=(Tk_find_index &&) = default;
};
class Tk_idt_nature : public Node {
public:
  Tk_idt_nature(std::string element);
  Tk_idt_nature(Tk_idt_nature &&) = default;
  Tk_idt_nature &operator=(Tk_idt_nature &&) = default;
};
class Tk_import : public Node {
public:
  Tk_import(std::string element);
  Tk_import(Tk_import &&) = default;
  Tk_import &operator=(Tk_import &&) = default;
};
class Tk_colon_div : public Node {
public:
  Tk_colon_div(std::string element);
  Tk_colon_div(Tk_colon_div &&) = default;
  Tk_colon_div &operator=(Tk_colon_div &&) = default;
};
class Block_event_or_expr : public Node {
public:
  Block_event_or_expr(std::string element);
  Block_event_or_expr(Block_event_or_expr &&) = default;
  Block_event_or_expr &operator=(Block_event_or_expr &&) = default;
};

using ClassMap =
    std::unordered_map<std::string,
                       std::function<std::unique_ptr<Node>(std::string &&)>>;
extern ClassMap classMap;

#endif
