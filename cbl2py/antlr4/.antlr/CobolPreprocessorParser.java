// Generated from /home/fausto/cbl2py/cbl2py/antlr4/CobolPreprocessor.g4 by ANTLR 4.9.2
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class CobolPreprocessorParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		ADATA=1, ADV=2, ALIAS=3, ANSI=4, ANY=5, APOST=6, AR=7, ARITH=8, AUTO=9, 
		AWO=10, BIN=11, BLOCK0=12, BUF=13, BUFSIZE=14, BY=15, CBL=16, CBLCARD=17, 
		CICS=18, CO=19, COBOL2=20, COBOL3=21, CODEPAGE=22, COMPAT=23, COMPILE=24, 
		COPY=25, CP=26, CPP=27, CPSM=28, CS=29, CURR=30, CURRENCY=31, DATA=32, 
		DATEPROC=33, DBCS=34, DD=35, DEBUG=36, DECK=37, DIAGTRUNC=38, DLI=39, 
		DLL=40, DP=41, DTR=42, DU=43, DUMP=44, DYN=45, DYNAM=46, EDF=47, EJECT=48, 
		EJPD=49, EN=50, ENGLISH=51, END_EXEC=52, EPILOG=53, EXCI=54, EXEC=55, 
		EXIT=56, EXP=57, EXPORTALL=58, EXTEND=59, FASTSRT=60, FEPI=61, FLAG=62, 
		FLAGSTD=63, FSRT=64, FULL=65, GDS=66, GRAPHIC=67, HOOK=68, IN=69, INCLUDE=70, 
		INTDATE=71, JA=72, JP=73, KA=74, LANG=75, LANGUAGE=76, LC=77, LEASM=78, 
		LENGTH=79, LIB=80, LILIAN=81, LIN=82, LINECOUNT=83, LINKAGE=84, LIST=85, 
		LM=86, LONGMIXED=87, LONGUPPER=88, LPARENCHAR=89, LU=90, MAP=91, MARGINS=92, 
		MAX=93, MD=94, MDECK=95, MIG=96, MIXED=97, NAME=98, NAT=99, NATIONAL=100, 
		NATLANG=101, NN=102, NO=103, NOADATA=104, NOADV=105, NOALIAS=106, NOAWO=107, 
		NOBLOCK0=108, NOC=109, NOCBLCARD=110, NOCICS=111, NOCMPR2=112, NOCOMPILE=113, 
		NOCPSM=114, NOCURR=115, NOCURRENCY=116, NOD=117, NODATEPROC=118, NODBCS=119, 
		NODE=120, NODEBUG=121, NODECK=122, NODIAGTRUNC=123, NODLL=124, NODU=125, 
		NODUMP=126, NODP=127, NODTR=128, NODYN=129, NODYNAM=130, NOEDF=131, NOEJPD=132, 
		NOEPILOG=133, NOEXIT=134, NOEXP=135, NOEXPORTALL=136, NOF=137, NOFASTSRT=138, 
		NOFEPI=139, NOFLAG=140, NOFLAGMIG=141, NOFLAGSTD=142, NOFSRT=143, NOGRAPHIC=144, 
		NOHOOK=145, NOLENGTH=146, NOLIB=147, NOLINKAGE=148, NOLIST=149, NOMAP=150, 
		NOMD=151, NOMDECK=152, NONAME=153, NONUM=154, NONUMBER=155, NOOBJ=156, 
		NOOBJECT=157, NOOFF=158, NOOFFSET=159, NOOPSEQUENCE=160, NOOPT=161, NOOPTIMIZE=162, 
		NOOPTIONS=163, NOP=164, NOPFD=165, NOPROLOG=166, NORENT=167, NOS=168, 
		NOSEP=169, NOSEPARATE=170, NOSEQ=171, NOSOURCE=172, NOSPIE=173, NOSQL=174, 
		NOSQLC=175, NOSQLCCSID=176, NOSSR=177, NOSSRANGE=178, NOSTDTRUNC=179, 
		NOSEQUENCE=180, NOTERM=181, NOTERMINAL=182, NOTEST=183, NOTHREAD=184, 
		NOTRIG=185, NOVBREF=186, NOWD=187, NOWORD=188, NOX=189, NOXREF=190, NOZWB=191, 
		NS=192, NSEQ=193, NSYMBOL=194, NUM=195, NUMBER=196, NUMPROC=197, OBJ=198, 
		OBJECT=199, OF=200, OFF=201, OFFSET=202, ON=203, OP=204, OPMARGINS=205, 
		OPSEQUENCE=206, OPT=207, OPTFILE=208, OPTIMIZE=209, OPTIONS=210, OUT=211, 
		OUTDD=212, PFD=213, PPTDBG=214, PGMN=215, PGMNAME=216, PROCESS=217, PROLOG=218, 
		QUOTE=219, RENT=220, REPLACE=221, REPLACING=222, RMODE=223, RPARENCHAR=224, 
		SEP=225, SEPARATE=226, SEQ=227, SEQUENCE=228, SHORT=229, SIZE=230, SOURCE=231, 
		SP=232, SPACE=233, SPIE=234, SQL=235, SQLC=236, SQLCCSID=237, SQLIMS=238, 
		SKIP1=239, SKIP2=240, SKIP3=241, SS=242, SSR=243, SSRANGE=244, STD=245, 
		SUPPRESS=246, SYSEIB=247, SZ=248, TERM=249, TERMINAL=250, TEST=251, THREAD=252, 
		TITLE=253, TRIG=254, TRUNC=255, UE=256, UPPER=257, VBREF=258, WD=259, 
		WORD=260, XMLPARSE=261, XMLSS=262, XOPTS=263, XP=264, XREF=265, YEARWINDOW=266, 
		YW=267, ZWB=268, C_CHAR=269, D_CHAR=270, E_CHAR=271, F_CHAR=272, H_CHAR=273, 
		I_CHAR=274, M_CHAR=275, N_CHAR=276, Q_CHAR=277, S_CHAR=278, U_CHAR=279, 
		W_CHAR=280, X_CHAR=281, COMMENTTAG=282, COMMACHAR=283, DOT=284, DOUBLEEQUALCHAR=285, 
		NONNUMERICLITERAL=286, NUMERICLITERAL=287, IDENTIFIER=288, FILENAME=289, 
		NEWLINE=290, COMMENTLINE=291, WS=292, TEXT=293;
	public static final int
		RULE_startRule = 0, RULE_compilerOptions = 1, RULE_compilerXOpts = 2, 
		RULE_compilerOption = 3, RULE_execCicsStatement = 4, RULE_execSqlStatement = 5, 
		RULE_execSqlImsStatement = 6, RULE_includeSource = 7, RULE_copyStatement = 8, 
		RULE_copySource = 9, RULE_copyLibrary = 10, RULE_replacingPhrase = 11, 
		RULE_replaceArea = 12, RULE_replaceByStatement = 13, RULE_replaceOffStatement = 14, 
		RULE_replaceClause = 15, RULE_directoryPhrase = 16, RULE_familyPhrase = 17, 
		RULE_replaceable = 18, RULE_replacement = 19, RULE_ejectStatement = 20, 
		RULE_skipStatement = 21, RULE_titleStatement = 22, RULE_pseudoText = 23, 
		RULE_charData = 24, RULE_charDataSql = 25, RULE_charDataLine = 26, RULE_cobolWord = 27, 
		RULE_literal = 28, RULE_filename = 29, RULE_charDataKeyword = 30;
	private static String[] makeRuleNames() {
		return new String[] {
			"startRule", "compilerOptions", "compilerXOpts", "compilerOption", "execCicsStatement", 
			"execSqlStatement", "execSqlImsStatement", "includeSource", "copyStatement", 
			"copySource", "copyLibrary", "replacingPhrase", "replaceArea", "replaceByStatement", 
			"replaceOffStatement", "replaceClause", "directoryPhrase", "familyPhrase", 
			"replaceable", "replacement", "ejectStatement", "skipStatement", "titleStatement", 
			"pseudoText", "charData", "charDataSql", "charDataLine", "cobolWord", 
			"literal", "filename", "charDataKeyword"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, "'('", null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, "')'", null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, "'*>'", "','", "'.'", "'=='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "ADATA", "ADV", "ALIAS", "ANSI", "ANY", "APOST", "AR", "ARITH", 
			"AUTO", "AWO", "BIN", "BLOCK0", "BUF", "BUFSIZE", "BY", "CBL", "CBLCARD", 
			"CICS", "CO", "COBOL2", "COBOL3", "CODEPAGE", "COMPAT", "COMPILE", "COPY", 
			"CP", "CPP", "CPSM", "CS", "CURR", "CURRENCY", "DATA", "DATEPROC", "DBCS", 
			"DD", "DEBUG", "DECK", "DIAGTRUNC", "DLI", "DLL", "DP", "DTR", "DU", 
			"DUMP", "DYN", "DYNAM", "EDF", "EJECT", "EJPD", "EN", "ENGLISH", "END_EXEC", 
			"EPILOG", "EXCI", "EXEC", "EXIT", "EXP", "EXPORTALL", "EXTEND", "FASTSRT", 
			"FEPI", "FLAG", "FLAGSTD", "FSRT", "FULL", "GDS", "GRAPHIC", "HOOK", 
			"IN", "INCLUDE", "INTDATE", "JA", "JP", "KA", "LANG", "LANGUAGE", "LC", 
			"LEASM", "LENGTH", "LIB", "LILIAN", "LIN", "LINECOUNT", "LINKAGE", "LIST", 
			"LM", "LONGMIXED", "LONGUPPER", "LPARENCHAR", "LU", "MAP", "MARGINS", 
			"MAX", "MD", "MDECK", "MIG", "MIXED", "NAME", "NAT", "NATIONAL", "NATLANG", 
			"NN", "NO", "NOADATA", "NOADV", "NOALIAS", "NOAWO", "NOBLOCK0", "NOC", 
			"NOCBLCARD", "NOCICS", "NOCMPR2", "NOCOMPILE", "NOCPSM", "NOCURR", "NOCURRENCY", 
			"NOD", "NODATEPROC", "NODBCS", "NODE", "NODEBUG", "NODECK", "NODIAGTRUNC", 
			"NODLL", "NODU", "NODUMP", "NODP", "NODTR", "NODYN", "NODYNAM", "NOEDF", 
			"NOEJPD", "NOEPILOG", "NOEXIT", "NOEXP", "NOEXPORTALL", "NOF", "NOFASTSRT", 
			"NOFEPI", "NOFLAG", "NOFLAGMIG", "NOFLAGSTD", "NOFSRT", "NOGRAPHIC", 
			"NOHOOK", "NOLENGTH", "NOLIB", "NOLINKAGE", "NOLIST", "NOMAP", "NOMD", 
			"NOMDECK", "NONAME", "NONUM", "NONUMBER", "NOOBJ", "NOOBJECT", "NOOFF", 
			"NOOFFSET", "NOOPSEQUENCE", "NOOPT", "NOOPTIMIZE", "NOOPTIONS", "NOP", 
			"NOPFD", "NOPROLOG", "NORENT", "NOS", "NOSEP", "NOSEPARATE", "NOSEQ", 
			"NOSOURCE", "NOSPIE", "NOSQL", "NOSQLC", "NOSQLCCSID", "NOSSR", "NOSSRANGE", 
			"NOSTDTRUNC", "NOSEQUENCE", "NOTERM", "NOTERMINAL", "NOTEST", "NOTHREAD", 
			"NOTRIG", "NOVBREF", "NOWD", "NOWORD", "NOX", "NOXREF", "NOZWB", "NS", 
			"NSEQ", "NSYMBOL", "NUM", "NUMBER", "NUMPROC", "OBJ", "OBJECT", "OF", 
			"OFF", "OFFSET", "ON", "OP", "OPMARGINS", "OPSEQUENCE", "OPT", "OPTFILE", 
			"OPTIMIZE", "OPTIONS", "OUT", "OUTDD", "PFD", "PPTDBG", "PGMN", "PGMNAME", 
			"PROCESS", "PROLOG", "QUOTE", "RENT", "REPLACE", "REPLACING", "RMODE", 
			"RPARENCHAR", "SEP", "SEPARATE", "SEQ", "SEQUENCE", "SHORT", "SIZE", 
			"SOURCE", "SP", "SPACE", "SPIE", "SQL", "SQLC", "SQLCCSID", "SQLIMS", 
			"SKIP1", "SKIP2", "SKIP3", "SS", "SSR", "SSRANGE", "STD", "SUPPRESS", 
			"SYSEIB", "SZ", "TERM", "TERMINAL", "TEST", "THREAD", "TITLE", "TRIG", 
			"TRUNC", "UE", "UPPER", "VBREF", "WD", "WORD", "XMLPARSE", "XMLSS", "XOPTS", 
			"XP", "XREF", "YEARWINDOW", "YW", "ZWB", "C_CHAR", "D_CHAR", "E_CHAR", 
			"F_CHAR", "H_CHAR", "I_CHAR", "M_CHAR", "N_CHAR", "Q_CHAR", "S_CHAR", 
			"U_CHAR", "W_CHAR", "X_CHAR", "COMMENTTAG", "COMMACHAR", "DOT", "DOUBLEEQUALCHAR", 
			"NONNUMERICLITERAL", "NUMERICLITERAL", "IDENTIFIER", "FILENAME", "NEWLINE", 
			"COMMENTLINE", "WS", "TEXT"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "CobolPreprocessor.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public CobolPreprocessorParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class StartRuleContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(CobolPreprocessorParser.EOF, 0); }
		public List<CompilerOptionsContext> compilerOptions() {
			return getRuleContexts(CompilerOptionsContext.class);
		}
		public CompilerOptionsContext compilerOptions(int i) {
			return getRuleContext(CompilerOptionsContext.class,i);
		}
		public List<CopyStatementContext> copyStatement() {
			return getRuleContexts(CopyStatementContext.class);
		}
		public CopyStatementContext copyStatement(int i) {
			return getRuleContext(CopyStatementContext.class,i);
		}
		public List<ExecCicsStatementContext> execCicsStatement() {
			return getRuleContexts(ExecCicsStatementContext.class);
		}
		public ExecCicsStatementContext execCicsStatement(int i) {
			return getRuleContext(ExecCicsStatementContext.class,i);
		}
		public List<ExecSqlStatementContext> execSqlStatement() {
			return getRuleContexts(ExecSqlStatementContext.class);
		}
		public ExecSqlStatementContext execSqlStatement(int i) {
			return getRuleContext(ExecSqlStatementContext.class,i);
		}
		public List<ExecSqlImsStatementContext> execSqlImsStatement() {
			return getRuleContexts(ExecSqlImsStatementContext.class);
		}
		public ExecSqlImsStatementContext execSqlImsStatement(int i) {
			return getRuleContext(ExecSqlImsStatementContext.class,i);
		}
		public List<ReplaceOffStatementContext> replaceOffStatement() {
			return getRuleContexts(ReplaceOffStatementContext.class);
		}
		public ReplaceOffStatementContext replaceOffStatement(int i) {
			return getRuleContext(ReplaceOffStatementContext.class,i);
		}
		public List<ReplaceAreaContext> replaceArea() {
			return getRuleContexts(ReplaceAreaContext.class);
		}
		public ReplaceAreaContext replaceArea(int i) {
			return getRuleContext(ReplaceAreaContext.class,i);
		}
		public List<EjectStatementContext> ejectStatement() {
			return getRuleContexts(EjectStatementContext.class);
		}
		public EjectStatementContext ejectStatement(int i) {
			return getRuleContext(EjectStatementContext.class,i);
		}
		public List<SkipStatementContext> skipStatement() {
			return getRuleContexts(SkipStatementContext.class);
		}
		public SkipStatementContext skipStatement(int i) {
			return getRuleContext(SkipStatementContext.class,i);
		}
		public List<TitleStatementContext> titleStatement() {
			return getRuleContexts(TitleStatementContext.class);
		}
		public TitleStatementContext titleStatement(int i) {
			return getRuleContext(TitleStatementContext.class,i);
		}
		public List<CharDataLineContext> charDataLine() {
			return getRuleContexts(CharDataLineContext.class);
		}
		public CharDataLineContext charDataLine(int i) {
			return getRuleContext(CharDataLineContext.class,i);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public StartRuleContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_startRule; }
	}

	public final StartRuleContext startRule() throws RecognitionException {
		StartRuleContext _localctx = new StartRuleContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_startRule);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(76);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ADATA) | (1L << ADV) | (1L << ALIAS) | (1L << ANSI) | (1L << ANY) | (1L << APOST) | (1L << AR) | (1L << ARITH) | (1L << AUTO) | (1L << AWO) | (1L << BIN) | (1L << BLOCK0) | (1L << BUF) | (1L << BUFSIZE) | (1L << BY) | (1L << CBL) | (1L << CBLCARD) | (1L << CO) | (1L << COBOL2) | (1L << COBOL3) | (1L << CODEPAGE) | (1L << COMPAT) | (1L << COMPILE) | (1L << COPY) | (1L << CP) | (1L << CPP) | (1L << CPSM) | (1L << CS) | (1L << CURR) | (1L << CURRENCY) | (1L << DATA) | (1L << DATEPROC) | (1L << DBCS) | (1L << DD) | (1L << DEBUG) | (1L << DECK) | (1L << DIAGTRUNC) | (1L << DLI) | (1L << DLL) | (1L << DP) | (1L << DTR) | (1L << DU) | (1L << DUMP) | (1L << DYN) | (1L << DYNAM) | (1L << EDF) | (1L << EJECT) | (1L << EJPD) | (1L << EN) | (1L << ENGLISH) | (1L << EPILOG) | (1L << EXCI) | (1L << EXEC) | (1L << EXIT) | (1L << EXP) | (1L << EXPORTALL) | (1L << EXTEND) | (1L << FASTSRT) | (1L << FLAG) | (1L << FLAGSTD))) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1L << (_la - 64)) & ((1L << (FSRT - 64)) | (1L << (FULL - 64)) | (1L << (GDS - 64)) | (1L << (GRAPHIC - 64)) | (1L << (HOOK - 64)) | (1L << (IN - 64)) | (1L << (INTDATE - 64)) | (1L << (JA - 64)) | (1L << (JP - 64)) | (1L << (KA - 64)) | (1L << (LANG - 64)) | (1L << (LANGUAGE - 64)) | (1L << (LC - 64)) | (1L << (LENGTH - 64)) | (1L << (LIB - 64)) | (1L << (LILIAN - 64)) | (1L << (LIN - 64)) | (1L << (LINECOUNT - 64)) | (1L << (LINKAGE - 64)) | (1L << (LIST - 64)) | (1L << (LM - 64)) | (1L << (LONGMIXED - 64)) | (1L << (LONGUPPER - 64)) | (1L << (LPARENCHAR - 64)) | (1L << (LU - 64)) | (1L << (MAP - 64)) | (1L << (MARGINS - 64)) | (1L << (MAX - 64)) | (1L << (MD - 64)) | (1L << (MDECK - 64)) | (1L << (MIG - 64)) | (1L << (MIXED - 64)) | (1L << (NAME - 64)) | (1L << (NAT - 64)) | (1L << (NATIONAL - 64)) | (1L << (NATLANG - 64)) | (1L << (NN - 64)) | (1L << (NO - 64)) | (1L << (NOADATA - 64)) | (1L << (NOADV - 64)) | (1L << (NOALIAS - 64)) | (1L << (NOAWO - 64)) | (1L << (NOBLOCK0 - 64)) | (1L << (NOC - 64)) | (1L << (NOCBLCARD - 64)) | (1L << (NOCICS - 64)) | (1L << (NOCMPR2 - 64)) | (1L << (NOCOMPILE - 64)) | (1L << (NOCPSM - 64)) | (1L << (NOCURR - 64)) | (1L << (NOCURRENCY - 64)) | (1L << (NOD - 64)) | (1L << (NODATEPROC - 64)) | (1L << (NODBCS - 64)) | (1L << (NODE - 64)) | (1L << (NODEBUG - 64)) | (1L << (NODECK - 64)) | (1L << (NODIAGTRUNC - 64)) | (1L << (NODLL - 64)) | (1L << (NODU - 64)) | (1L << (NODUMP - 64)) | (1L << (NODP - 64)))) != 0) || ((((_la - 128)) & ~0x3f) == 0 && ((1L << (_la - 128)) & ((1L << (NODTR - 128)) | (1L << (NODYN - 128)) | (1L << (NODYNAM - 128)) | (1L << (NOEDF - 128)) | (1L << (NOEJPD - 128)) | (1L << (NOEPILOG - 128)) | (1L << (NOEXIT - 128)) | (1L << (NOEXP - 128)) | (1L << (NOEXPORTALL - 128)) | (1L << (NOF - 128)) | (1L << (NOFASTSRT - 128)) | (1L << (NOFEPI - 128)) | (1L << (NOFLAG - 128)) | (1L << (NOFLAGMIG - 128)) | (1L << (NOFLAGSTD - 128)) | (1L << (NOFSRT - 128)) | (1L << (NOGRAPHIC - 128)) | (1L << (NOHOOK - 128)) | (1L << (NOLENGTH - 128)) | (1L << (NOLIB - 128)) | (1L << (NOLINKAGE - 128)) | (1L << (NOLIST - 128)) | (1L << (NOMAP - 128)) | (1L << (NOMD - 128)) | (1L << (NOMDECK - 128)) | (1L << (NONAME - 128)) | (1L << (NONUM - 128)) | (1L << (NONUMBER - 128)) | (1L << (NOOBJ - 128)) | (1L << (NOOBJECT - 128)) | (1L << (NOOFF - 128)) | (1L << (NOOFFSET - 128)) | (1L << (NOOPSEQUENCE - 128)) | (1L << (NOOPT - 128)) | (1L << (NOOPTIMIZE - 128)) | (1L << (NOOPTIONS - 128)) | (1L << (NOP - 128)) | (1L << (NOPFD - 128)) | (1L << (NOPROLOG - 128)) | (1L << (NORENT - 128)) | (1L << (NOS - 128)) | (1L << (NOSEP - 128)) | (1L << (NOSEPARATE - 128)) | (1L << (NOSEQ - 128)) | (1L << (NOSOURCE - 128)) | (1L << (NOSPIE - 128)) | (1L << (NOSQL - 128)) | (1L << (NOSQLC - 128)) | (1L << (NOSQLCCSID - 128)) | (1L << (NOSSR - 128)) | (1L << (NOSSRANGE - 128)) | (1L << (NOSTDTRUNC - 128)) | (1L << (NOSEQUENCE - 128)) | (1L << (NOTERM - 128)) | (1L << (NOTERMINAL - 128)) | (1L << (NOTEST - 128)) | (1L << (NOTHREAD - 128)) | (1L << (NOTRIG - 128)) | (1L << (NOVBREF - 128)) | (1L << (NOWORD - 128)) | (1L << (NOX - 128)) | (1L << (NOXREF - 128)) | (1L << (NOZWB - 128)))) != 0) || ((((_la - 192)) & ~0x3f) == 0 && ((1L << (_la - 192)) & ((1L << (NS - 192)) | (1L << (NSEQ - 192)) | (1L << (NSYMBOL - 192)) | (1L << (NUM - 192)) | (1L << (NUMBER - 192)) | (1L << (NUMPROC - 192)) | (1L << (OBJ - 192)) | (1L << (OBJECT - 192)) | (1L << (OF - 192)) | (1L << (OFF - 192)) | (1L << (OFFSET - 192)) | (1L << (ON - 192)) | (1L << (OP - 192)) | (1L << (OPMARGINS - 192)) | (1L << (OPSEQUENCE - 192)) | (1L << (OPT - 192)) | (1L << (OPTFILE - 192)) | (1L << (OPTIMIZE - 192)) | (1L << (OPTIONS - 192)) | (1L << (OUT - 192)) | (1L << (OUTDD - 192)) | (1L << (PFD - 192)) | (1L << (PPTDBG - 192)) | (1L << (PGMN - 192)) | (1L << (PGMNAME - 192)) | (1L << (PROCESS - 192)) | (1L << (PROLOG - 192)) | (1L << (QUOTE - 192)) | (1L << (RENT - 192)) | (1L << (REPLACE - 192)) | (1L << (REPLACING - 192)) | (1L << (RMODE - 192)) | (1L << (RPARENCHAR - 192)) | (1L << (SEP - 192)) | (1L << (SEPARATE - 192)) | (1L << (SEQ - 192)) | (1L << (SEQUENCE - 192)) | (1L << (SHORT - 192)) | (1L << (SIZE - 192)) | (1L << (SOURCE - 192)) | (1L << (SP - 192)) | (1L << (SPACE - 192)) | (1L << (SPIE - 192)) | (1L << (SQL - 192)) | (1L << (SQLC - 192)) | (1L << (SQLCCSID - 192)) | (1L << (SKIP1 - 192)) | (1L << (SKIP2 - 192)) | (1L << (SKIP3 - 192)) | (1L << (SS - 192)) | (1L << (SSR - 192)) | (1L << (SSRANGE - 192)) | (1L << (STD - 192)) | (1L << (SYSEIB - 192)) | (1L << (SZ - 192)) | (1L << (TERM - 192)) | (1L << (TERMINAL - 192)) | (1L << (TEST - 192)) | (1L << (THREAD - 192)) | (1L << (TITLE - 192)) | (1L << (TRIG - 192)) | (1L << (TRUNC - 192)))) != 0) || ((((_la - 256)) & ~0x3f) == 0 && ((1L << (_la - 256)) & ((1L << (UE - 256)) | (1L << (UPPER - 256)) | (1L << (VBREF - 256)) | (1L << (WD - 256)) | (1L << (XMLPARSE - 256)) | (1L << (XMLSS - 256)) | (1L << (XOPTS - 256)) | (1L << (XREF - 256)) | (1L << (YEARWINDOW - 256)) | (1L << (YW - 256)) | (1L << (ZWB - 256)) | (1L << (C_CHAR - 256)) | (1L << (D_CHAR - 256)) | (1L << (E_CHAR - 256)) | (1L << (F_CHAR - 256)) | (1L << (H_CHAR - 256)) | (1L << (I_CHAR - 256)) | (1L << (M_CHAR - 256)) | (1L << (N_CHAR - 256)) | (1L << (Q_CHAR - 256)) | (1L << (S_CHAR - 256)) | (1L << (U_CHAR - 256)) | (1L << (W_CHAR - 256)) | (1L << (X_CHAR - 256)) | (1L << (COMMACHAR - 256)) | (1L << (DOT - 256)) | (1L << (NONNUMERICLITERAL - 256)) | (1L << (NUMERICLITERAL - 256)) | (1L << (IDENTIFIER - 256)) | (1L << (FILENAME - 256)) | (1L << (NEWLINE - 256)) | (1L << (TEXT - 256)))) != 0)) {
				{
				setState(74);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,0,_ctx) ) {
				case 1:
					{
					setState(62);
					compilerOptions();
					}
					break;
				case 2:
					{
					setState(63);
					copyStatement();
					}
					break;
				case 3:
					{
					setState(64);
					execCicsStatement();
					}
					break;
				case 4:
					{
					setState(65);
					execSqlStatement();
					}
					break;
				case 5:
					{
					setState(66);
					execSqlImsStatement();
					}
					break;
				case 6:
					{
					setState(67);
					replaceOffStatement();
					}
					break;
				case 7:
					{
					setState(68);
					replaceArea();
					}
					break;
				case 8:
					{
					setState(69);
					ejectStatement();
					}
					break;
				case 9:
					{
					setState(70);
					skipStatement();
					}
					break;
				case 10:
					{
					setState(71);
					titleStatement();
					}
					break;
				case 11:
					{
					setState(72);
					charDataLine();
					}
					break;
				case 12:
					{
					setState(73);
					match(NEWLINE);
					}
					break;
				}
				}
				setState(78);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(79);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CompilerOptionsContext extends ParserRuleContext {
		public TerminalNode PROCESS() { return getToken(CobolPreprocessorParser.PROCESS, 0); }
		public TerminalNode CBL() { return getToken(CobolPreprocessorParser.CBL, 0); }
		public List<CompilerOptionContext> compilerOption() {
			return getRuleContexts(CompilerOptionContext.class);
		}
		public CompilerOptionContext compilerOption(int i) {
			return getRuleContext(CompilerOptionContext.class,i);
		}
		public List<CompilerXOptsContext> compilerXOpts() {
			return getRuleContexts(CompilerXOptsContext.class);
		}
		public CompilerXOptsContext compilerXOpts(int i) {
			return getRuleContext(CompilerXOptsContext.class,i);
		}
		public List<TerminalNode> COMMACHAR() { return getTokens(CobolPreprocessorParser.COMMACHAR); }
		public TerminalNode COMMACHAR(int i) {
			return getToken(CobolPreprocessorParser.COMMACHAR, i);
		}
		public CompilerOptionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_compilerOptions; }
	}

	public final CompilerOptionsContext compilerOptions() throws RecognitionException {
		CompilerOptionsContext _localctx = new CompilerOptionsContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_compilerOptions);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(81);
			_la = _input.LA(1);
			if ( !(_la==CBL || _la==PROCESS) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(87); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					setState(87);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case ADATA:
					case ADV:
					case APOST:
					case AR:
					case ARITH:
					case AWO:
					case BLOCK0:
					case BUF:
					case BUFSIZE:
					case CBLCARD:
					case CICS:
					case COBOL2:
					case COBOL3:
					case CODEPAGE:
					case COMPILE:
					case CP:
					case CPP:
					case CPSM:
					case CURR:
					case CURRENCY:
					case DATA:
					case DATEPROC:
					case DBCS:
					case DEBUG:
					case DECK:
					case DIAGTRUNC:
					case DLL:
					case DP:
					case DTR:
					case DU:
					case DUMP:
					case DYN:
					case DYNAM:
					case EDF:
					case EPILOG:
					case EXIT:
					case EXP:
					case EXPORTALL:
					case FASTSRT:
					case FEPI:
					case FLAG:
					case FLAGSTD:
					case FSRT:
					case GDS:
					case GRAPHIC:
					case INTDATE:
					case LANG:
					case LANGUAGE:
					case LC:
					case LEASM:
					case LENGTH:
					case LIB:
					case LIN:
					case LINECOUNT:
					case LINKAGE:
					case LIST:
					case MAP:
					case MARGINS:
					case MD:
					case MDECK:
					case NAME:
					case NATLANG:
					case NOADATA:
					case NOADV:
					case NOAWO:
					case NOBLOCK0:
					case NOC:
					case NOCBLCARD:
					case NOCICS:
					case NOCMPR2:
					case NOCOMPILE:
					case NOCPSM:
					case NOCURR:
					case NOCURRENCY:
					case NOD:
					case NODATEPROC:
					case NODBCS:
					case NODE:
					case NODEBUG:
					case NODECK:
					case NODIAGTRUNC:
					case NODLL:
					case NODU:
					case NODUMP:
					case NODP:
					case NODTR:
					case NODYN:
					case NODYNAM:
					case NOEDF:
					case NOEPILOG:
					case NOEXIT:
					case NOEXP:
					case NOEXPORTALL:
					case NOF:
					case NOFASTSRT:
					case NOFEPI:
					case NOFLAG:
					case NOFLAGMIG:
					case NOFLAGSTD:
					case NOFSRT:
					case NOGRAPHIC:
					case NOLENGTH:
					case NOLIB:
					case NOLINKAGE:
					case NOLIST:
					case NOMAP:
					case NOMD:
					case NOMDECK:
					case NONAME:
					case NONUM:
					case NONUMBER:
					case NOOBJ:
					case NOOBJECT:
					case NOOFF:
					case NOOFFSET:
					case NOOPSEQUENCE:
					case NOOPT:
					case NOOPTIMIZE:
					case NOOPTIONS:
					case NOP:
					case NOPROLOG:
					case NORENT:
					case NOS:
					case NOSEQ:
					case NOSOURCE:
					case NOSPIE:
					case NOSQL:
					case NOSQLC:
					case NOSQLCCSID:
					case NOSSR:
					case NOSSRANGE:
					case NOSTDTRUNC:
					case NOSEQUENCE:
					case NOTERM:
					case NOTERMINAL:
					case NOTEST:
					case NOTHREAD:
					case NOVBREF:
					case NOWD:
					case NOWORD:
					case NOX:
					case NOXREF:
					case NOZWB:
					case NS:
					case NSEQ:
					case NSYMBOL:
					case NUM:
					case NUMBER:
					case NUMPROC:
					case OBJ:
					case OBJECT:
					case OFF:
					case OFFSET:
					case OP:
					case OPMARGINS:
					case OPSEQUENCE:
					case OPT:
					case OPTFILE:
					case OPTIMIZE:
					case OPTIONS:
					case OUT:
					case OUTDD:
					case PGMN:
					case PGMNAME:
					case PROLOG:
					case QUOTE:
					case RENT:
					case RMODE:
					case SEQ:
					case SEQUENCE:
					case SIZE:
					case SOURCE:
					case SP:
					case SPACE:
					case SPIE:
					case SQL:
					case SQLC:
					case SQLCCSID:
					case SSR:
					case SSRANGE:
					case SYSEIB:
					case SZ:
					case TERM:
					case TERMINAL:
					case TEST:
					case THREAD:
					case TRUNC:
					case VBREF:
					case WD:
					case WORD:
					case XMLPARSE:
					case XP:
					case XREF:
					case YEARWINDOW:
					case YW:
					case ZWB:
					case C_CHAR:
					case D_CHAR:
					case F_CHAR:
					case Q_CHAR:
					case S_CHAR:
					case X_CHAR:
					case COMMACHAR:
						{
						setState(83);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (_la==COMMACHAR) {
							{
							setState(82);
							match(COMMACHAR);
							}
						}

						setState(85);
						compilerOption();
						}
						break;
					case XOPTS:
						{
						setState(86);
						compilerXOpts();
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(89); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,4,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CompilerXOptsContext extends ParserRuleContext {
		public TerminalNode XOPTS() { return getToken(CobolPreprocessorParser.XOPTS, 0); }
		public TerminalNode LPARENCHAR() { return getToken(CobolPreprocessorParser.LPARENCHAR, 0); }
		public List<CompilerOptionContext> compilerOption() {
			return getRuleContexts(CompilerOptionContext.class);
		}
		public CompilerOptionContext compilerOption(int i) {
			return getRuleContext(CompilerOptionContext.class,i);
		}
		public TerminalNode RPARENCHAR() { return getToken(CobolPreprocessorParser.RPARENCHAR, 0); }
		public List<TerminalNode> COMMACHAR() { return getTokens(CobolPreprocessorParser.COMMACHAR); }
		public TerminalNode COMMACHAR(int i) {
			return getToken(CobolPreprocessorParser.COMMACHAR, i);
		}
		public CompilerXOptsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_compilerXOpts; }
	}

	public final CompilerXOptsContext compilerXOpts() throws RecognitionException {
		CompilerXOptsContext _localctx = new CompilerXOptsContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_compilerXOpts);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(91);
			match(XOPTS);
			setState(92);
			match(LPARENCHAR);
			setState(93);
			compilerOption();
			setState(100);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ADATA) | (1L << ADV) | (1L << APOST) | (1L << AR) | (1L << ARITH) | (1L << AWO) | (1L << BLOCK0) | (1L << BUF) | (1L << BUFSIZE) | (1L << CBLCARD) | (1L << CICS) | (1L << COBOL2) | (1L << COBOL3) | (1L << CODEPAGE) | (1L << COMPILE) | (1L << CP) | (1L << CPP) | (1L << CPSM) | (1L << CURR) | (1L << CURRENCY) | (1L << DATA) | (1L << DATEPROC) | (1L << DBCS) | (1L << DEBUG) | (1L << DECK) | (1L << DIAGTRUNC) | (1L << DLL) | (1L << DP) | (1L << DTR) | (1L << DU) | (1L << DUMP) | (1L << DYN) | (1L << DYNAM) | (1L << EDF) | (1L << EPILOG) | (1L << EXIT) | (1L << EXP) | (1L << EXPORTALL) | (1L << FASTSRT) | (1L << FEPI) | (1L << FLAG) | (1L << FLAGSTD))) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1L << (_la - 64)) & ((1L << (FSRT - 64)) | (1L << (GDS - 64)) | (1L << (GRAPHIC - 64)) | (1L << (INTDATE - 64)) | (1L << (LANG - 64)) | (1L << (LANGUAGE - 64)) | (1L << (LC - 64)) | (1L << (LEASM - 64)) | (1L << (LENGTH - 64)) | (1L << (LIB - 64)) | (1L << (LIN - 64)) | (1L << (LINECOUNT - 64)) | (1L << (LINKAGE - 64)) | (1L << (LIST - 64)) | (1L << (MAP - 64)) | (1L << (MARGINS - 64)) | (1L << (MD - 64)) | (1L << (MDECK - 64)) | (1L << (NAME - 64)) | (1L << (NATLANG - 64)) | (1L << (NOADATA - 64)) | (1L << (NOADV - 64)) | (1L << (NOAWO - 64)) | (1L << (NOBLOCK0 - 64)) | (1L << (NOC - 64)) | (1L << (NOCBLCARD - 64)) | (1L << (NOCICS - 64)) | (1L << (NOCMPR2 - 64)) | (1L << (NOCOMPILE - 64)) | (1L << (NOCPSM - 64)) | (1L << (NOCURR - 64)) | (1L << (NOCURRENCY - 64)) | (1L << (NOD - 64)) | (1L << (NODATEPROC - 64)) | (1L << (NODBCS - 64)) | (1L << (NODE - 64)) | (1L << (NODEBUG - 64)) | (1L << (NODECK - 64)) | (1L << (NODIAGTRUNC - 64)) | (1L << (NODLL - 64)) | (1L << (NODU - 64)) | (1L << (NODUMP - 64)) | (1L << (NODP - 64)))) != 0) || ((((_la - 128)) & ~0x3f) == 0 && ((1L << (_la - 128)) & ((1L << (NODTR - 128)) | (1L << (NODYN - 128)) | (1L << (NODYNAM - 128)) | (1L << (NOEDF - 128)) | (1L << (NOEPILOG - 128)) | (1L << (NOEXIT - 128)) | (1L << (NOEXP - 128)) | (1L << (NOEXPORTALL - 128)) | (1L << (NOF - 128)) | (1L << (NOFASTSRT - 128)) | (1L << (NOFEPI - 128)) | (1L << (NOFLAG - 128)) | (1L << (NOFLAGMIG - 128)) | (1L << (NOFLAGSTD - 128)) | (1L << (NOFSRT - 128)) | (1L << (NOGRAPHIC - 128)) | (1L << (NOLENGTH - 128)) | (1L << (NOLIB - 128)) | (1L << (NOLINKAGE - 128)) | (1L << (NOLIST - 128)) | (1L << (NOMAP - 128)) | (1L << (NOMD - 128)) | (1L << (NOMDECK - 128)) | (1L << (NONAME - 128)) | (1L << (NONUM - 128)) | (1L << (NONUMBER - 128)) | (1L << (NOOBJ - 128)) | (1L << (NOOBJECT - 128)) | (1L << (NOOFF - 128)) | (1L << (NOOFFSET - 128)) | (1L << (NOOPSEQUENCE - 128)) | (1L << (NOOPT - 128)) | (1L << (NOOPTIMIZE - 128)) | (1L << (NOOPTIONS - 128)) | (1L << (NOP - 128)) | (1L << (NOPROLOG - 128)) | (1L << (NORENT - 128)) | (1L << (NOS - 128)) | (1L << (NOSEQ - 128)) | (1L << (NOSOURCE - 128)) | (1L << (NOSPIE - 128)) | (1L << (NOSQL - 128)) | (1L << (NOSQLC - 128)) | (1L << (NOSQLCCSID - 128)) | (1L << (NOSSR - 128)) | (1L << (NOSSRANGE - 128)) | (1L << (NOSTDTRUNC - 128)) | (1L << (NOSEQUENCE - 128)) | (1L << (NOTERM - 128)) | (1L << (NOTERMINAL - 128)) | (1L << (NOTEST - 128)) | (1L << (NOTHREAD - 128)) | (1L << (NOVBREF - 128)) | (1L << (NOWD - 128)) | (1L << (NOWORD - 128)) | (1L << (NOX - 128)) | (1L << (NOXREF - 128)) | (1L << (NOZWB - 128)))) != 0) || ((((_la - 192)) & ~0x3f) == 0 && ((1L << (_la - 192)) & ((1L << (NS - 192)) | (1L << (NSEQ - 192)) | (1L << (NSYMBOL - 192)) | (1L << (NUM - 192)) | (1L << (NUMBER - 192)) | (1L << (NUMPROC - 192)) | (1L << (OBJ - 192)) | (1L << (OBJECT - 192)) | (1L << (OFF - 192)) | (1L << (OFFSET - 192)) | (1L << (OP - 192)) | (1L << (OPMARGINS - 192)) | (1L << (OPSEQUENCE - 192)) | (1L << (OPT - 192)) | (1L << (OPTFILE - 192)) | (1L << (OPTIMIZE - 192)) | (1L << (OPTIONS - 192)) | (1L << (OUT - 192)) | (1L << (OUTDD - 192)) | (1L << (PGMN - 192)) | (1L << (PGMNAME - 192)) | (1L << (PROLOG - 192)) | (1L << (QUOTE - 192)) | (1L << (RENT - 192)) | (1L << (RMODE - 192)) | (1L << (SEQ - 192)) | (1L << (SEQUENCE - 192)) | (1L << (SIZE - 192)) | (1L << (SOURCE - 192)) | (1L << (SP - 192)) | (1L << (SPACE - 192)) | (1L << (SPIE - 192)) | (1L << (SQL - 192)) | (1L << (SQLC - 192)) | (1L << (SQLCCSID - 192)) | (1L << (SSR - 192)) | (1L << (SSRANGE - 192)) | (1L << (SYSEIB - 192)) | (1L << (SZ - 192)) | (1L << (TERM - 192)) | (1L << (TERMINAL - 192)) | (1L << (TEST - 192)) | (1L << (THREAD - 192)) | (1L << (TRUNC - 192)))) != 0) || ((((_la - 258)) & ~0x3f) == 0 && ((1L << (_la - 258)) & ((1L << (VBREF - 258)) | (1L << (WD - 258)) | (1L << (WORD - 258)) | (1L << (XMLPARSE - 258)) | (1L << (XP - 258)) | (1L << (XREF - 258)) | (1L << (YEARWINDOW - 258)) | (1L << (YW - 258)) | (1L << (ZWB - 258)) | (1L << (C_CHAR - 258)) | (1L << (D_CHAR - 258)) | (1L << (F_CHAR - 258)) | (1L << (Q_CHAR - 258)) | (1L << (S_CHAR - 258)) | (1L << (X_CHAR - 258)) | (1L << (COMMACHAR - 258)))) != 0)) {
				{
				{
				setState(95);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMACHAR) {
					{
					setState(94);
					match(COMMACHAR);
					}
				}

				setState(97);
				compilerOption();
				}
				}
				setState(102);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(103);
			match(RPARENCHAR);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CompilerOptionContext extends ParserRuleContext {
		public TerminalNode ADATA() { return getToken(CobolPreprocessorParser.ADATA, 0); }
		public TerminalNode ADV() { return getToken(CobolPreprocessorParser.ADV, 0); }
		public TerminalNode APOST() { return getToken(CobolPreprocessorParser.APOST, 0); }
		public TerminalNode LPARENCHAR() { return getToken(CobolPreprocessorParser.LPARENCHAR, 0); }
		public TerminalNode RPARENCHAR() { return getToken(CobolPreprocessorParser.RPARENCHAR, 0); }
		public TerminalNode ARITH() { return getToken(CobolPreprocessorParser.ARITH, 0); }
		public TerminalNode AR() { return getToken(CobolPreprocessorParser.AR, 0); }
		public TerminalNode EXTEND() { return getToken(CobolPreprocessorParser.EXTEND, 0); }
		public List<TerminalNode> E_CHAR() { return getTokens(CobolPreprocessorParser.E_CHAR); }
		public TerminalNode E_CHAR(int i) {
			return getToken(CobolPreprocessorParser.E_CHAR, i);
		}
		public TerminalNode COMPAT() { return getToken(CobolPreprocessorParser.COMPAT, 0); }
		public TerminalNode C_CHAR() { return getToken(CobolPreprocessorParser.C_CHAR, 0); }
		public TerminalNode AWO() { return getToken(CobolPreprocessorParser.AWO, 0); }
		public TerminalNode BLOCK0() { return getToken(CobolPreprocessorParser.BLOCK0, 0); }
		public List<LiteralContext> literal() {
			return getRuleContexts(LiteralContext.class);
		}
		public LiteralContext literal(int i) {
			return getRuleContext(LiteralContext.class,i);
		}
		public TerminalNode BUFSIZE() { return getToken(CobolPreprocessorParser.BUFSIZE, 0); }
		public TerminalNode BUF() { return getToken(CobolPreprocessorParser.BUF, 0); }
		public TerminalNode CBLCARD() { return getToken(CobolPreprocessorParser.CBLCARD, 0); }
		public TerminalNode CICS() { return getToken(CobolPreprocessorParser.CICS, 0); }
		public TerminalNode COBOL2() { return getToken(CobolPreprocessorParser.COBOL2, 0); }
		public TerminalNode COBOL3() { return getToken(CobolPreprocessorParser.COBOL3, 0); }
		public TerminalNode CODEPAGE() { return getToken(CobolPreprocessorParser.CODEPAGE, 0); }
		public TerminalNode CP() { return getToken(CobolPreprocessorParser.CP, 0); }
		public TerminalNode COMPILE() { return getToken(CobolPreprocessorParser.COMPILE, 0); }
		public TerminalNode CPP() { return getToken(CobolPreprocessorParser.CPP, 0); }
		public TerminalNode CPSM() { return getToken(CobolPreprocessorParser.CPSM, 0); }
		public TerminalNode CURRENCY() { return getToken(CobolPreprocessorParser.CURRENCY, 0); }
		public TerminalNode CURR() { return getToken(CobolPreprocessorParser.CURR, 0); }
		public TerminalNode DATA() { return getToken(CobolPreprocessorParser.DATA, 0); }
		public TerminalNode DATEPROC() { return getToken(CobolPreprocessorParser.DATEPROC, 0); }
		public TerminalNode DP() { return getToken(CobolPreprocessorParser.DP, 0); }
		public List<TerminalNode> COMMACHAR() { return getTokens(CobolPreprocessorParser.COMMACHAR); }
		public TerminalNode COMMACHAR(int i) {
			return getToken(CobolPreprocessorParser.COMMACHAR, i);
		}
		public TerminalNode FLAG() { return getToken(CobolPreprocessorParser.FLAG, 0); }
		public TerminalNode NOFLAG() { return getToken(CobolPreprocessorParser.NOFLAG, 0); }
		public TerminalNode TRIG() { return getToken(CobolPreprocessorParser.TRIG, 0); }
		public TerminalNode NOTRIG() { return getToken(CobolPreprocessorParser.NOTRIG, 0); }
		public TerminalNode DBCS() { return getToken(CobolPreprocessorParser.DBCS, 0); }
		public TerminalNode DECK() { return getToken(CobolPreprocessorParser.DECK, 0); }
		public TerminalNode D_CHAR() { return getToken(CobolPreprocessorParser.D_CHAR, 0); }
		public TerminalNode DEBUG() { return getToken(CobolPreprocessorParser.DEBUG, 0); }
		public TerminalNode DIAGTRUNC() { return getToken(CobolPreprocessorParser.DIAGTRUNC, 0); }
		public TerminalNode DTR() { return getToken(CobolPreprocessorParser.DTR, 0); }
		public TerminalNode DLL() { return getToken(CobolPreprocessorParser.DLL, 0); }
		public TerminalNode DUMP() { return getToken(CobolPreprocessorParser.DUMP, 0); }
		public TerminalNode DU() { return getToken(CobolPreprocessorParser.DU, 0); }
		public TerminalNode DYNAM() { return getToken(CobolPreprocessorParser.DYNAM, 0); }
		public TerminalNode DYN() { return getToken(CobolPreprocessorParser.DYN, 0); }
		public TerminalNode EDF() { return getToken(CobolPreprocessorParser.EDF, 0); }
		public TerminalNode EPILOG() { return getToken(CobolPreprocessorParser.EPILOG, 0); }
		public TerminalNode EXIT() { return getToken(CobolPreprocessorParser.EXIT, 0); }
		public TerminalNode EXPORTALL() { return getToken(CobolPreprocessorParser.EXPORTALL, 0); }
		public TerminalNode EXP() { return getToken(CobolPreprocessorParser.EXP, 0); }
		public TerminalNode FASTSRT() { return getToken(CobolPreprocessorParser.FASTSRT, 0); }
		public TerminalNode FSRT() { return getToken(CobolPreprocessorParser.FSRT, 0); }
		public TerminalNode FEPI() { return getToken(CobolPreprocessorParser.FEPI, 0); }
		public TerminalNode F_CHAR() { return getToken(CobolPreprocessorParser.F_CHAR, 0); }
		public List<TerminalNode> I_CHAR() { return getTokens(CobolPreprocessorParser.I_CHAR); }
		public TerminalNode I_CHAR(int i) {
			return getToken(CobolPreprocessorParser.I_CHAR, i);
		}
		public List<TerminalNode> S_CHAR() { return getTokens(CobolPreprocessorParser.S_CHAR); }
		public TerminalNode S_CHAR(int i) {
			return getToken(CobolPreprocessorParser.S_CHAR, i);
		}
		public List<TerminalNode> U_CHAR() { return getTokens(CobolPreprocessorParser.U_CHAR); }
		public TerminalNode U_CHAR(int i) {
			return getToken(CobolPreprocessorParser.U_CHAR, i);
		}
		public List<TerminalNode> W_CHAR() { return getTokens(CobolPreprocessorParser.W_CHAR); }
		public TerminalNode W_CHAR(int i) {
			return getToken(CobolPreprocessorParser.W_CHAR, i);
		}
		public TerminalNode FLAGSTD() { return getToken(CobolPreprocessorParser.FLAGSTD, 0); }
		public TerminalNode M_CHAR() { return getToken(CobolPreprocessorParser.M_CHAR, 0); }
		public TerminalNode H_CHAR() { return getToken(CobolPreprocessorParser.H_CHAR, 0); }
		public TerminalNode DD() { return getToken(CobolPreprocessorParser.DD, 0); }
		public TerminalNode N_CHAR() { return getToken(CobolPreprocessorParser.N_CHAR, 0); }
		public TerminalNode NN() { return getToken(CobolPreprocessorParser.NN, 0); }
		public TerminalNode SS() { return getToken(CobolPreprocessorParser.SS, 0); }
		public TerminalNode GDS() { return getToken(CobolPreprocessorParser.GDS, 0); }
		public TerminalNode GRAPHIC() { return getToken(CobolPreprocessorParser.GRAPHIC, 0); }
		public TerminalNode INTDATE() { return getToken(CobolPreprocessorParser.INTDATE, 0); }
		public TerminalNode ANSI() { return getToken(CobolPreprocessorParser.ANSI, 0); }
		public TerminalNode LILIAN() { return getToken(CobolPreprocessorParser.LILIAN, 0); }
		public TerminalNode LANGUAGE() { return getToken(CobolPreprocessorParser.LANGUAGE, 0); }
		public TerminalNode LANG() { return getToken(CobolPreprocessorParser.LANG, 0); }
		public TerminalNode ENGLISH() { return getToken(CobolPreprocessorParser.ENGLISH, 0); }
		public TerminalNode CS() { return getToken(CobolPreprocessorParser.CS, 0); }
		public TerminalNode EN() { return getToken(CobolPreprocessorParser.EN, 0); }
		public TerminalNode JA() { return getToken(CobolPreprocessorParser.JA, 0); }
		public TerminalNode JP() { return getToken(CobolPreprocessorParser.JP, 0); }
		public TerminalNode KA() { return getToken(CobolPreprocessorParser.KA, 0); }
		public TerminalNode UE() { return getToken(CobolPreprocessorParser.UE, 0); }
		public TerminalNode LEASM() { return getToken(CobolPreprocessorParser.LEASM, 0); }
		public TerminalNode LENGTH() { return getToken(CobolPreprocessorParser.LENGTH, 0); }
		public TerminalNode LIB() { return getToken(CobolPreprocessorParser.LIB, 0); }
		public TerminalNode LIN() { return getToken(CobolPreprocessorParser.LIN, 0); }
		public TerminalNode LINECOUNT() { return getToken(CobolPreprocessorParser.LINECOUNT, 0); }
		public TerminalNode LC() { return getToken(CobolPreprocessorParser.LC, 0); }
		public TerminalNode LINKAGE() { return getToken(CobolPreprocessorParser.LINKAGE, 0); }
		public TerminalNode LIST() { return getToken(CobolPreprocessorParser.LIST, 0); }
		public TerminalNode MAP() { return getToken(CobolPreprocessorParser.MAP, 0); }
		public TerminalNode MARGINS() { return getToken(CobolPreprocessorParser.MARGINS, 0); }
		public TerminalNode MDECK() { return getToken(CobolPreprocessorParser.MDECK, 0); }
		public TerminalNode MD() { return getToken(CobolPreprocessorParser.MD, 0); }
		public TerminalNode NOC() { return getToken(CobolPreprocessorParser.NOC, 0); }
		public TerminalNode NOCOMPILE() { return getToken(CobolPreprocessorParser.NOCOMPILE, 0); }
		public TerminalNode NAME() { return getToken(CobolPreprocessorParser.NAME, 0); }
		public TerminalNode ALIAS() { return getToken(CobolPreprocessorParser.ALIAS, 0); }
		public TerminalNode NOALIAS() { return getToken(CobolPreprocessorParser.NOALIAS, 0); }
		public TerminalNode NATLANG() { return getToken(CobolPreprocessorParser.NATLANG, 0); }
		public TerminalNode NOADATA() { return getToken(CobolPreprocessorParser.NOADATA, 0); }
		public TerminalNode NOADV() { return getToken(CobolPreprocessorParser.NOADV, 0); }
		public TerminalNode NOAWO() { return getToken(CobolPreprocessorParser.NOAWO, 0); }
		public TerminalNode NOBLOCK0() { return getToken(CobolPreprocessorParser.NOBLOCK0, 0); }
		public TerminalNode NOCBLCARD() { return getToken(CobolPreprocessorParser.NOCBLCARD, 0); }
		public TerminalNode NOCICS() { return getToken(CobolPreprocessorParser.NOCICS, 0); }
		public TerminalNode NOCMPR2() { return getToken(CobolPreprocessorParser.NOCMPR2, 0); }
		public TerminalNode NOCPSM() { return getToken(CobolPreprocessorParser.NOCPSM, 0); }
		public TerminalNode NOCURRENCY() { return getToken(CobolPreprocessorParser.NOCURRENCY, 0); }
		public TerminalNode NOCURR() { return getToken(CobolPreprocessorParser.NOCURR, 0); }
		public TerminalNode NODATEPROC() { return getToken(CobolPreprocessorParser.NODATEPROC, 0); }
		public TerminalNode NODP() { return getToken(CobolPreprocessorParser.NODP, 0); }
		public TerminalNode NODBCS() { return getToken(CobolPreprocessorParser.NODBCS, 0); }
		public TerminalNode NODEBUG() { return getToken(CobolPreprocessorParser.NODEBUG, 0); }
		public TerminalNode NODECK() { return getToken(CobolPreprocessorParser.NODECK, 0); }
		public TerminalNode NOD() { return getToken(CobolPreprocessorParser.NOD, 0); }
		public TerminalNode NODLL() { return getToken(CobolPreprocessorParser.NODLL, 0); }
		public TerminalNode NODE() { return getToken(CobolPreprocessorParser.NODE, 0); }
		public TerminalNode NODUMP() { return getToken(CobolPreprocessorParser.NODUMP, 0); }
		public TerminalNode NODU() { return getToken(CobolPreprocessorParser.NODU, 0); }
		public TerminalNode NODIAGTRUNC() { return getToken(CobolPreprocessorParser.NODIAGTRUNC, 0); }
		public TerminalNode NODTR() { return getToken(CobolPreprocessorParser.NODTR, 0); }
		public TerminalNode NODYNAM() { return getToken(CobolPreprocessorParser.NODYNAM, 0); }
		public TerminalNode NODYN() { return getToken(CobolPreprocessorParser.NODYN, 0); }
		public TerminalNode NOEDF() { return getToken(CobolPreprocessorParser.NOEDF, 0); }
		public TerminalNode NOEPILOG() { return getToken(CobolPreprocessorParser.NOEPILOG, 0); }
		public TerminalNode NOEXIT() { return getToken(CobolPreprocessorParser.NOEXIT, 0); }
		public TerminalNode NOEXPORTALL() { return getToken(CobolPreprocessorParser.NOEXPORTALL, 0); }
		public TerminalNode NOEXP() { return getToken(CobolPreprocessorParser.NOEXP, 0); }
		public TerminalNode NOFASTSRT() { return getToken(CobolPreprocessorParser.NOFASTSRT, 0); }
		public TerminalNode NOFSRT() { return getToken(CobolPreprocessorParser.NOFSRT, 0); }
		public TerminalNode NOFEPI() { return getToken(CobolPreprocessorParser.NOFEPI, 0); }
		public TerminalNode NOF() { return getToken(CobolPreprocessorParser.NOF, 0); }
		public TerminalNode NOFLAGMIG() { return getToken(CobolPreprocessorParser.NOFLAGMIG, 0); }
		public TerminalNode NOFLAGSTD() { return getToken(CobolPreprocessorParser.NOFLAGSTD, 0); }
		public TerminalNode NOGRAPHIC() { return getToken(CobolPreprocessorParser.NOGRAPHIC, 0); }
		public TerminalNode NOLENGTH() { return getToken(CobolPreprocessorParser.NOLENGTH, 0); }
		public TerminalNode NOLIB() { return getToken(CobolPreprocessorParser.NOLIB, 0); }
		public TerminalNode NOLINKAGE() { return getToken(CobolPreprocessorParser.NOLINKAGE, 0); }
		public TerminalNode NOLIST() { return getToken(CobolPreprocessorParser.NOLIST, 0); }
		public TerminalNode NOMAP() { return getToken(CobolPreprocessorParser.NOMAP, 0); }
		public TerminalNode NOMDECK() { return getToken(CobolPreprocessorParser.NOMDECK, 0); }
		public TerminalNode NOMD() { return getToken(CobolPreprocessorParser.NOMD, 0); }
		public TerminalNode NONAME() { return getToken(CobolPreprocessorParser.NONAME, 0); }
		public TerminalNode NONUMBER() { return getToken(CobolPreprocessorParser.NONUMBER, 0); }
		public TerminalNode NONUM() { return getToken(CobolPreprocessorParser.NONUM, 0); }
		public TerminalNode NOOBJECT() { return getToken(CobolPreprocessorParser.NOOBJECT, 0); }
		public TerminalNode NOOBJ() { return getToken(CobolPreprocessorParser.NOOBJ, 0); }
		public TerminalNode NOOFFSET() { return getToken(CobolPreprocessorParser.NOOFFSET, 0); }
		public TerminalNode NOOFF() { return getToken(CobolPreprocessorParser.NOOFF, 0); }
		public TerminalNode NOOPSEQUENCE() { return getToken(CobolPreprocessorParser.NOOPSEQUENCE, 0); }
		public TerminalNode NOOPTIMIZE() { return getToken(CobolPreprocessorParser.NOOPTIMIZE, 0); }
		public TerminalNode NOOPT() { return getToken(CobolPreprocessorParser.NOOPT, 0); }
		public TerminalNode NOOPTIONS() { return getToken(CobolPreprocessorParser.NOOPTIONS, 0); }
		public TerminalNode NOP() { return getToken(CobolPreprocessorParser.NOP, 0); }
		public TerminalNode NOPROLOG() { return getToken(CobolPreprocessorParser.NOPROLOG, 0); }
		public TerminalNode NORENT() { return getToken(CobolPreprocessorParser.NORENT, 0); }
		public TerminalNode NOSEQUENCE() { return getToken(CobolPreprocessorParser.NOSEQUENCE, 0); }
		public TerminalNode NOSEQ() { return getToken(CobolPreprocessorParser.NOSEQ, 0); }
		public TerminalNode NOSOURCE() { return getToken(CobolPreprocessorParser.NOSOURCE, 0); }
		public TerminalNode NOS() { return getToken(CobolPreprocessorParser.NOS, 0); }
		public TerminalNode NOSPIE() { return getToken(CobolPreprocessorParser.NOSPIE, 0); }
		public TerminalNode NOSQL() { return getToken(CobolPreprocessorParser.NOSQL, 0); }
		public TerminalNode NOSQLCCSID() { return getToken(CobolPreprocessorParser.NOSQLCCSID, 0); }
		public TerminalNode NOSQLC() { return getToken(CobolPreprocessorParser.NOSQLC, 0); }
		public TerminalNode NOSSRANGE() { return getToken(CobolPreprocessorParser.NOSSRANGE, 0); }
		public TerminalNode NOSSR() { return getToken(CobolPreprocessorParser.NOSSR, 0); }
		public TerminalNode NOSTDTRUNC() { return getToken(CobolPreprocessorParser.NOSTDTRUNC, 0); }
		public TerminalNode NOTERMINAL() { return getToken(CobolPreprocessorParser.NOTERMINAL, 0); }
		public TerminalNode NOTERM() { return getToken(CobolPreprocessorParser.NOTERM, 0); }
		public TerminalNode NOTEST() { return getToken(CobolPreprocessorParser.NOTEST, 0); }
		public TerminalNode NOTHREAD() { return getToken(CobolPreprocessorParser.NOTHREAD, 0); }
		public TerminalNode NOVBREF() { return getToken(CobolPreprocessorParser.NOVBREF, 0); }
		public TerminalNode NOWORD() { return getToken(CobolPreprocessorParser.NOWORD, 0); }
		public TerminalNode NOWD() { return getToken(CobolPreprocessorParser.NOWD, 0); }
		public TerminalNode NSEQ() { return getToken(CobolPreprocessorParser.NSEQ, 0); }
		public TerminalNode NSYMBOL() { return getToken(CobolPreprocessorParser.NSYMBOL, 0); }
		public TerminalNode NS() { return getToken(CobolPreprocessorParser.NS, 0); }
		public TerminalNode NATIONAL() { return getToken(CobolPreprocessorParser.NATIONAL, 0); }
		public TerminalNode NAT() { return getToken(CobolPreprocessorParser.NAT, 0); }
		public TerminalNode NOXREF() { return getToken(CobolPreprocessorParser.NOXREF, 0); }
		public TerminalNode NOX() { return getToken(CobolPreprocessorParser.NOX, 0); }
		public TerminalNode NOZWB() { return getToken(CobolPreprocessorParser.NOZWB, 0); }
		public TerminalNode NUMBER() { return getToken(CobolPreprocessorParser.NUMBER, 0); }
		public TerminalNode NUM() { return getToken(CobolPreprocessorParser.NUM, 0); }
		public TerminalNode NUMPROC() { return getToken(CobolPreprocessorParser.NUMPROC, 0); }
		public TerminalNode MIG() { return getToken(CobolPreprocessorParser.MIG, 0); }
		public TerminalNode NOPFD() { return getToken(CobolPreprocessorParser.NOPFD, 0); }
		public TerminalNode PFD() { return getToken(CobolPreprocessorParser.PFD, 0); }
		public TerminalNode OBJECT() { return getToken(CobolPreprocessorParser.OBJECT, 0); }
		public TerminalNode OBJ() { return getToken(CobolPreprocessorParser.OBJ, 0); }
		public TerminalNode OFFSET() { return getToken(CobolPreprocessorParser.OFFSET, 0); }
		public TerminalNode OFF() { return getToken(CobolPreprocessorParser.OFF, 0); }
		public TerminalNode OPMARGINS() { return getToken(CobolPreprocessorParser.OPMARGINS, 0); }
		public TerminalNode OPSEQUENCE() { return getToken(CobolPreprocessorParser.OPSEQUENCE, 0); }
		public TerminalNode OPTIMIZE() { return getToken(CobolPreprocessorParser.OPTIMIZE, 0); }
		public TerminalNode OPT() { return getToken(CobolPreprocessorParser.OPT, 0); }
		public TerminalNode FULL() { return getToken(CobolPreprocessorParser.FULL, 0); }
		public TerminalNode STD() { return getToken(CobolPreprocessorParser.STD, 0); }
		public TerminalNode OPTFILE() { return getToken(CobolPreprocessorParser.OPTFILE, 0); }
		public TerminalNode OPTIONS() { return getToken(CobolPreprocessorParser.OPTIONS, 0); }
		public TerminalNode OP() { return getToken(CobolPreprocessorParser.OP, 0); }
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public TerminalNode OUTDD() { return getToken(CobolPreprocessorParser.OUTDD, 0); }
		public TerminalNode OUT() { return getToken(CobolPreprocessorParser.OUT, 0); }
		public TerminalNode PGMNAME() { return getToken(CobolPreprocessorParser.PGMNAME, 0); }
		public TerminalNode PGMN() { return getToken(CobolPreprocessorParser.PGMN, 0); }
		public TerminalNode CO() { return getToken(CobolPreprocessorParser.CO, 0); }
		public TerminalNode LM() { return getToken(CobolPreprocessorParser.LM, 0); }
		public TerminalNode LONGMIXED() { return getToken(CobolPreprocessorParser.LONGMIXED, 0); }
		public TerminalNode LONGUPPER() { return getToken(CobolPreprocessorParser.LONGUPPER, 0); }
		public TerminalNode LU() { return getToken(CobolPreprocessorParser.LU, 0); }
		public TerminalNode MIXED() { return getToken(CobolPreprocessorParser.MIXED, 0); }
		public TerminalNode UPPER() { return getToken(CobolPreprocessorParser.UPPER, 0); }
		public TerminalNode PROLOG() { return getToken(CobolPreprocessorParser.PROLOG, 0); }
		public TerminalNode QUOTE() { return getToken(CobolPreprocessorParser.QUOTE, 0); }
		public TerminalNode Q_CHAR() { return getToken(CobolPreprocessorParser.Q_CHAR, 0); }
		public TerminalNode RENT() { return getToken(CobolPreprocessorParser.RENT, 0); }
		public TerminalNode RMODE() { return getToken(CobolPreprocessorParser.RMODE, 0); }
		public TerminalNode ANY() { return getToken(CobolPreprocessorParser.ANY, 0); }
		public TerminalNode AUTO() { return getToken(CobolPreprocessorParser.AUTO, 0); }
		public TerminalNode SEQUENCE() { return getToken(CobolPreprocessorParser.SEQUENCE, 0); }
		public TerminalNode SEQ() { return getToken(CobolPreprocessorParser.SEQ, 0); }
		public TerminalNode SIZE() { return getToken(CobolPreprocessorParser.SIZE, 0); }
		public TerminalNode SZ() { return getToken(CobolPreprocessorParser.SZ, 0); }
		public TerminalNode MAX() { return getToken(CobolPreprocessorParser.MAX, 0); }
		public TerminalNode SOURCE() { return getToken(CobolPreprocessorParser.SOURCE, 0); }
		public TerminalNode SP() { return getToken(CobolPreprocessorParser.SP, 0); }
		public TerminalNode SPACE() { return getToken(CobolPreprocessorParser.SPACE, 0); }
		public TerminalNode SPIE() { return getToken(CobolPreprocessorParser.SPIE, 0); }
		public TerminalNode SQL() { return getToken(CobolPreprocessorParser.SQL, 0); }
		public TerminalNode SQLCCSID() { return getToken(CobolPreprocessorParser.SQLCCSID, 0); }
		public TerminalNode SQLC() { return getToken(CobolPreprocessorParser.SQLC, 0); }
		public TerminalNode SSRANGE() { return getToken(CobolPreprocessorParser.SSRANGE, 0); }
		public TerminalNode SSR() { return getToken(CobolPreprocessorParser.SSR, 0); }
		public TerminalNode SYSEIB() { return getToken(CobolPreprocessorParser.SYSEIB, 0); }
		public TerminalNode TERMINAL() { return getToken(CobolPreprocessorParser.TERMINAL, 0); }
		public TerminalNode TERM() { return getToken(CobolPreprocessorParser.TERM, 0); }
		public TerminalNode TEST() { return getToken(CobolPreprocessorParser.TEST, 0); }
		public TerminalNode HOOK() { return getToken(CobolPreprocessorParser.HOOK, 0); }
		public TerminalNode NOHOOK() { return getToken(CobolPreprocessorParser.NOHOOK, 0); }
		public TerminalNode SEP() { return getToken(CobolPreprocessorParser.SEP, 0); }
		public TerminalNode SEPARATE() { return getToken(CobolPreprocessorParser.SEPARATE, 0); }
		public TerminalNode NOSEP() { return getToken(CobolPreprocessorParser.NOSEP, 0); }
		public TerminalNode NOSEPARATE() { return getToken(CobolPreprocessorParser.NOSEPARATE, 0); }
		public TerminalNode EJPD() { return getToken(CobolPreprocessorParser.EJPD, 0); }
		public TerminalNode NOEJPD() { return getToken(CobolPreprocessorParser.NOEJPD, 0); }
		public TerminalNode THREAD() { return getToken(CobolPreprocessorParser.THREAD, 0); }
		public TerminalNode TRUNC() { return getToken(CobolPreprocessorParser.TRUNC, 0); }
		public TerminalNode BIN() { return getToken(CobolPreprocessorParser.BIN, 0); }
		public TerminalNode VBREF() { return getToken(CobolPreprocessorParser.VBREF, 0); }
		public TerminalNode WORD() { return getToken(CobolPreprocessorParser.WORD, 0); }
		public TerminalNode WD() { return getToken(CobolPreprocessorParser.WD, 0); }
		public TerminalNode XMLPARSE() { return getToken(CobolPreprocessorParser.XMLPARSE, 0); }
		public TerminalNode XP() { return getToken(CobolPreprocessorParser.XP, 0); }
		public TerminalNode XMLSS() { return getToken(CobolPreprocessorParser.XMLSS, 0); }
		public TerminalNode X_CHAR() { return getToken(CobolPreprocessorParser.X_CHAR, 0); }
		public TerminalNode XREF() { return getToken(CobolPreprocessorParser.XREF, 0); }
		public TerminalNode SHORT() { return getToken(CobolPreprocessorParser.SHORT, 0); }
		public TerminalNode YEARWINDOW() { return getToken(CobolPreprocessorParser.YEARWINDOW, 0); }
		public TerminalNode YW() { return getToken(CobolPreprocessorParser.YW, 0); }
		public TerminalNode ZWB() { return getToken(CobolPreprocessorParser.ZWB, 0); }
		public CompilerOptionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_compilerOption; }
	}

	public final CompilerOptionContext compilerOption() throws RecognitionException {
		CompilerOptionContext _localctx = new CompilerOptionContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_compilerOption);
		int _la;
		try {
			setState(447);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,32,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(105);
				match(ADATA);
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(106);
				match(ADV);
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(107);
				match(APOST);
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(108);
				_la = _input.LA(1);
				if ( !(_la==AR || _la==ARITH) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(109);
				match(LPARENCHAR);
				setState(110);
				_la = _input.LA(1);
				if ( !(_la==COMPAT || _la==EXTEND || _la==C_CHAR || _la==E_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(111);
				match(RPARENCHAR);
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(112);
				match(AWO);
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(113);
				match(BLOCK0);
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(114);
				_la = _input.LA(1);
				if ( !(_la==BUF || _la==BUFSIZE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(115);
				match(LPARENCHAR);
				setState(116);
				literal();
				setState(117);
				match(RPARENCHAR);
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(119);
				match(CBLCARD);
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(120);
				match(CICS);
				setState(125);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,7,_ctx) ) {
				case 1:
					{
					setState(121);
					match(LPARENCHAR);
					setState(122);
					literal();
					setState(123);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 10:
				enterOuterAlt(_localctx, 10);
				{
				setState(127);
				match(COBOL2);
				}
				break;
			case 11:
				enterOuterAlt(_localctx, 11);
				{
				setState(128);
				match(COBOL3);
				}
				break;
			case 12:
				enterOuterAlt(_localctx, 12);
				{
				setState(129);
				_la = _input.LA(1);
				if ( !(_la==CODEPAGE || _la==CP) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(130);
				match(LPARENCHAR);
				setState(131);
				literal();
				setState(132);
				match(RPARENCHAR);
				}
				break;
			case 13:
				enterOuterAlt(_localctx, 13);
				{
				setState(134);
				_la = _input.LA(1);
				if ( !(_la==COMPILE || _la==C_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 14:
				enterOuterAlt(_localctx, 14);
				{
				setState(135);
				match(CPP);
				}
				break;
			case 15:
				enterOuterAlt(_localctx, 15);
				{
				setState(136);
				match(CPSM);
				}
				break;
			case 16:
				enterOuterAlt(_localctx, 16);
				{
				setState(137);
				_la = _input.LA(1);
				if ( !(_la==CURR || _la==CURRENCY) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(138);
				match(LPARENCHAR);
				setState(139);
				literal();
				setState(140);
				match(RPARENCHAR);
				}
				break;
			case 17:
				enterOuterAlt(_localctx, 17);
				{
				setState(142);
				match(DATA);
				setState(143);
				match(LPARENCHAR);
				setState(144);
				literal();
				setState(145);
				match(RPARENCHAR);
				}
				break;
			case 18:
				enterOuterAlt(_localctx, 18);
				{
				setState(147);
				_la = _input.LA(1);
				if ( !(_la==DATEPROC || _la==DP) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(159);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
				case 1:
					{
					setState(148);
					match(LPARENCHAR);
					setState(150);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==FLAG || _la==NOFLAG) {
						{
						setState(149);
						_la = _input.LA(1);
						if ( !(_la==FLAG || _la==NOFLAG) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
					}

					setState(153);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==COMMACHAR) {
						{
						setState(152);
						match(COMMACHAR);
						}
					}

					setState(156);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==NOTRIG || _la==TRIG) {
						{
						setState(155);
						_la = _input.LA(1);
						if ( !(_la==NOTRIG || _la==TRIG) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
					}

					setState(158);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 19:
				enterOuterAlt(_localctx, 19);
				{
				setState(161);
				match(DBCS);
				}
				break;
			case 20:
				enterOuterAlt(_localctx, 20);
				{
				setState(162);
				_la = _input.LA(1);
				if ( !(_la==DECK || _la==D_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 21:
				enterOuterAlt(_localctx, 21);
				{
				setState(163);
				match(DEBUG);
				}
				break;
			case 22:
				enterOuterAlt(_localctx, 22);
				{
				setState(164);
				_la = _input.LA(1);
				if ( !(_la==DIAGTRUNC || _la==DTR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 23:
				enterOuterAlt(_localctx, 23);
				{
				setState(165);
				match(DLL);
				}
				break;
			case 24:
				enterOuterAlt(_localctx, 24);
				{
				setState(166);
				_la = _input.LA(1);
				if ( !(_la==DU || _la==DUMP) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 25:
				enterOuterAlt(_localctx, 25);
				{
				setState(167);
				_la = _input.LA(1);
				if ( !(_la==DYN || _la==DYNAM) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 26:
				enterOuterAlt(_localctx, 26);
				{
				setState(168);
				match(EDF);
				}
				break;
			case 27:
				enterOuterAlt(_localctx, 27);
				{
				setState(169);
				match(EPILOG);
				}
				break;
			case 28:
				enterOuterAlt(_localctx, 28);
				{
				setState(170);
				match(EXIT);
				}
				break;
			case 29:
				enterOuterAlt(_localctx, 29);
				{
				setState(171);
				_la = _input.LA(1);
				if ( !(_la==EXP || _la==EXPORTALL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 30:
				enterOuterAlt(_localctx, 30);
				{
				setState(172);
				_la = _input.LA(1);
				if ( !(_la==FASTSRT || _la==FSRT) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 31:
				enterOuterAlt(_localctx, 31);
				{
				setState(173);
				match(FEPI);
				}
				break;
			case 32:
				enterOuterAlt(_localctx, 32);
				{
				setState(174);
				_la = _input.LA(1);
				if ( !(_la==FLAG || _la==F_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(175);
				match(LPARENCHAR);
				setState(176);
				_la = _input.LA(1);
				if ( !(((((_la - 271)) & ~0x3f) == 0 && ((1L << (_la - 271)) & ((1L << (E_CHAR - 271)) | (1L << (I_CHAR - 271)) | (1L << (S_CHAR - 271)) | (1L << (U_CHAR - 271)) | (1L << (W_CHAR - 271)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(179);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMACHAR) {
					{
					setState(177);
					match(COMMACHAR);
					setState(178);
					_la = _input.LA(1);
					if ( !(((((_la - 271)) & ~0x3f) == 0 && ((1L << (_la - 271)) & ((1L << (E_CHAR - 271)) | (1L << (I_CHAR - 271)) | (1L << (S_CHAR - 271)) | (1L << (U_CHAR - 271)) | (1L << (W_CHAR - 271)))) != 0)) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				setState(181);
				match(RPARENCHAR);
				}
				break;
			case 33:
				enterOuterAlt(_localctx, 33);
				{
				setState(182);
				match(FLAGSTD);
				setState(183);
				match(LPARENCHAR);
				setState(184);
				_la = _input.LA(1);
				if ( !(((((_la - 273)) & ~0x3f) == 0 && ((1L << (_la - 273)) & ((1L << (H_CHAR - 273)) | (1L << (I_CHAR - 273)) | (1L << (M_CHAR - 273)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(187);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMACHAR) {
					{
					setState(185);
					match(COMMACHAR);
					setState(186);
					_la = _input.LA(1);
					if ( !(_la==DD || _la==NN || ((((_la - 242)) & ~0x3f) == 0 && ((1L << (_la - 242)) & ((1L << (SS - 242)) | (1L << (D_CHAR - 242)) | (1L << (N_CHAR - 242)) | (1L << (S_CHAR - 242)))) != 0)) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					}
				}

				setState(189);
				match(RPARENCHAR);
				}
				break;
			case 34:
				enterOuterAlt(_localctx, 34);
				{
				setState(190);
				match(GDS);
				}
				break;
			case 35:
				enterOuterAlt(_localctx, 35);
				{
				setState(191);
				match(GRAPHIC);
				}
				break;
			case 36:
				enterOuterAlt(_localctx, 36);
				{
				setState(192);
				match(INTDATE);
				setState(193);
				match(LPARENCHAR);
				setState(194);
				_la = _input.LA(1);
				if ( !(_la==ANSI || _la==LILIAN) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(195);
				match(RPARENCHAR);
				}
				break;
			case 37:
				enterOuterAlt(_localctx, 37);
				{
				setState(196);
				_la = _input.LA(1);
				if ( !(_la==LANG || _la==LANGUAGE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(197);
				match(LPARENCHAR);
				setState(198);
				_la = _input.LA(1);
				if ( !(((((_la - 29)) & ~0x3f) == 0 && ((1L << (_la - 29)) & ((1L << (CS - 29)) | (1L << (EN - 29)) | (1L << (ENGLISH - 29)) | (1L << (JA - 29)) | (1L << (JP - 29)) | (1L << (KA - 29)))) != 0) || _la==UE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(199);
				match(RPARENCHAR);
				}
				break;
			case 38:
				enterOuterAlt(_localctx, 38);
				{
				setState(200);
				match(LEASM);
				}
				break;
			case 39:
				enterOuterAlt(_localctx, 39);
				{
				setState(201);
				match(LENGTH);
				}
				break;
			case 40:
				enterOuterAlt(_localctx, 40);
				{
				setState(202);
				match(LIB);
				}
				break;
			case 41:
				enterOuterAlt(_localctx, 41);
				{
				setState(203);
				match(LIN);
				}
				break;
			case 42:
				enterOuterAlt(_localctx, 42);
				{
				setState(204);
				_la = _input.LA(1);
				if ( !(_la==LC || _la==LINECOUNT) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(205);
				match(LPARENCHAR);
				setState(206);
				literal();
				setState(207);
				match(RPARENCHAR);
				}
				break;
			case 43:
				enterOuterAlt(_localctx, 43);
				{
				setState(209);
				match(LINKAGE);
				}
				break;
			case 44:
				enterOuterAlt(_localctx, 44);
				{
				setState(210);
				match(LIST);
				}
				break;
			case 45:
				enterOuterAlt(_localctx, 45);
				{
				setState(211);
				match(MAP);
				}
				break;
			case 46:
				enterOuterAlt(_localctx, 46);
				{
				setState(212);
				match(MARGINS);
				setState(213);
				match(LPARENCHAR);
				setState(214);
				literal();
				setState(215);
				match(COMMACHAR);
				setState(216);
				literal();
				setState(219);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMACHAR) {
					{
					setState(217);
					match(COMMACHAR);
					setState(218);
					literal();
					}
				}

				setState(221);
				match(RPARENCHAR);
				}
				break;
			case 47:
				enterOuterAlt(_localctx, 47);
				{
				setState(223);
				_la = _input.LA(1);
				if ( !(_la==MD || _la==MDECK) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(227);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
				case 1:
					{
					setState(224);
					match(LPARENCHAR);
					setState(225);
					_la = _input.LA(1);
					if ( !(_la==COMPILE || _la==NOC || _la==NOCOMPILE || _la==C_CHAR) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					setState(226);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 48:
				enterOuterAlt(_localctx, 48);
				{
				setState(229);
				match(NAME);
				setState(233);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
				case 1:
					{
					setState(230);
					match(LPARENCHAR);
					setState(231);
					_la = _input.LA(1);
					if ( !(_la==ALIAS || _la==NOALIAS) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					setState(232);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 49:
				enterOuterAlt(_localctx, 49);
				{
				setState(235);
				match(NATLANG);
				setState(236);
				match(LPARENCHAR);
				setState(237);
				_la = _input.LA(1);
				if ( !(((((_la - 29)) & ~0x3f) == 0 && ((1L << (_la - 29)) & ((1L << (CS - 29)) | (1L << (EN - 29)) | (1L << (KA - 29)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(238);
				match(RPARENCHAR);
				}
				break;
			case 50:
				enterOuterAlt(_localctx, 50);
				{
				setState(239);
				match(NOADATA);
				}
				break;
			case 51:
				enterOuterAlt(_localctx, 51);
				{
				setState(240);
				match(NOADV);
				}
				break;
			case 52:
				enterOuterAlt(_localctx, 52);
				{
				setState(241);
				match(NOAWO);
				}
				break;
			case 53:
				enterOuterAlt(_localctx, 53);
				{
				setState(242);
				match(NOBLOCK0);
				}
				break;
			case 54:
				enterOuterAlt(_localctx, 54);
				{
				setState(243);
				match(NOCBLCARD);
				}
				break;
			case 55:
				enterOuterAlt(_localctx, 55);
				{
				setState(244);
				match(NOCICS);
				}
				break;
			case 56:
				enterOuterAlt(_localctx, 56);
				{
				setState(245);
				match(NOCMPR2);
				}
				break;
			case 57:
				enterOuterAlt(_localctx, 57);
				{
				setState(246);
				_la = _input.LA(1);
				if ( !(_la==NOC || _la==NOCOMPILE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(250);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
				case 1:
					{
					setState(247);
					match(LPARENCHAR);
					setState(248);
					_la = _input.LA(1);
					if ( !(((((_la - 271)) & ~0x3f) == 0 && ((1L << (_la - 271)) & ((1L << (E_CHAR - 271)) | (1L << (S_CHAR - 271)) | (1L << (W_CHAR - 271)))) != 0)) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					setState(249);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 58:
				enterOuterAlt(_localctx, 58);
				{
				setState(252);
				match(NOCPSM);
				}
				break;
			case 59:
				enterOuterAlt(_localctx, 59);
				{
				setState(253);
				_la = _input.LA(1);
				if ( !(_la==NOCURR || _la==NOCURRENCY) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 60:
				enterOuterAlt(_localctx, 60);
				{
				setState(254);
				_la = _input.LA(1);
				if ( !(_la==NODATEPROC || _la==NODP) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 61:
				enterOuterAlt(_localctx, 61);
				{
				setState(255);
				match(NODBCS);
				}
				break;
			case 62:
				enterOuterAlt(_localctx, 62);
				{
				setState(256);
				match(NODEBUG);
				}
				break;
			case 63:
				enterOuterAlt(_localctx, 63);
				{
				setState(257);
				_la = _input.LA(1);
				if ( !(_la==NOD || _la==NODECK) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 64:
				enterOuterAlt(_localctx, 64);
				{
				setState(258);
				match(NODLL);
				}
				break;
			case 65:
				enterOuterAlt(_localctx, 65);
				{
				setState(259);
				match(NODE);
				}
				break;
			case 66:
				enterOuterAlt(_localctx, 66);
				{
				setState(260);
				_la = _input.LA(1);
				if ( !(_la==NODU || _la==NODUMP) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 67:
				enterOuterAlt(_localctx, 67);
				{
				setState(261);
				_la = _input.LA(1);
				if ( !(_la==NODIAGTRUNC || _la==NODTR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 68:
				enterOuterAlt(_localctx, 68);
				{
				setState(262);
				_la = _input.LA(1);
				if ( !(_la==NODYN || _la==NODYNAM) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 69:
				enterOuterAlt(_localctx, 69);
				{
				setState(263);
				match(NOEDF);
				}
				break;
			case 70:
				enterOuterAlt(_localctx, 70);
				{
				setState(264);
				match(NOEPILOG);
				}
				break;
			case 71:
				enterOuterAlt(_localctx, 71);
				{
				setState(265);
				match(NOEXIT);
				}
				break;
			case 72:
				enterOuterAlt(_localctx, 72);
				{
				setState(266);
				_la = _input.LA(1);
				if ( !(_la==NOEXP || _la==NOEXPORTALL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 73:
				enterOuterAlt(_localctx, 73);
				{
				setState(267);
				_la = _input.LA(1);
				if ( !(_la==NOFASTSRT || _la==NOFSRT) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 74:
				enterOuterAlt(_localctx, 74);
				{
				setState(268);
				match(NOFEPI);
				}
				break;
			case 75:
				enterOuterAlt(_localctx, 75);
				{
				setState(269);
				_la = _input.LA(1);
				if ( !(_la==NOF || _la==NOFLAG) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 76:
				enterOuterAlt(_localctx, 76);
				{
				setState(270);
				match(NOFLAGMIG);
				}
				break;
			case 77:
				enterOuterAlt(_localctx, 77);
				{
				setState(271);
				match(NOFLAGSTD);
				}
				break;
			case 78:
				enterOuterAlt(_localctx, 78);
				{
				setState(272);
				match(NOGRAPHIC);
				}
				break;
			case 79:
				enterOuterAlt(_localctx, 79);
				{
				setState(273);
				match(NOLENGTH);
				}
				break;
			case 80:
				enterOuterAlt(_localctx, 80);
				{
				setState(274);
				match(NOLIB);
				}
				break;
			case 81:
				enterOuterAlt(_localctx, 81);
				{
				setState(275);
				match(NOLINKAGE);
				}
				break;
			case 82:
				enterOuterAlt(_localctx, 82);
				{
				setState(276);
				match(NOLIST);
				}
				break;
			case 83:
				enterOuterAlt(_localctx, 83);
				{
				setState(277);
				match(NOMAP);
				}
				break;
			case 84:
				enterOuterAlt(_localctx, 84);
				{
				setState(278);
				_la = _input.LA(1);
				if ( !(_la==NOMD || _la==NOMDECK) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 85:
				enterOuterAlt(_localctx, 85);
				{
				setState(279);
				match(NONAME);
				}
				break;
			case 86:
				enterOuterAlt(_localctx, 86);
				{
				setState(280);
				_la = _input.LA(1);
				if ( !(_la==NONUM || _la==NONUMBER) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 87:
				enterOuterAlt(_localctx, 87);
				{
				setState(281);
				_la = _input.LA(1);
				if ( !(_la==NOOBJ || _la==NOOBJECT) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 88:
				enterOuterAlt(_localctx, 88);
				{
				setState(282);
				_la = _input.LA(1);
				if ( !(_la==NOOFF || _la==NOOFFSET) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 89:
				enterOuterAlt(_localctx, 89);
				{
				setState(283);
				match(NOOPSEQUENCE);
				}
				break;
			case 90:
				enterOuterAlt(_localctx, 90);
				{
				setState(284);
				_la = _input.LA(1);
				if ( !(_la==NOOPT || _la==NOOPTIMIZE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 91:
				enterOuterAlt(_localctx, 91);
				{
				setState(285);
				match(NOOPTIONS);
				}
				break;
			case 92:
				enterOuterAlt(_localctx, 92);
				{
				setState(286);
				match(NOP);
				}
				break;
			case 93:
				enterOuterAlt(_localctx, 93);
				{
				setState(287);
				match(NOPROLOG);
				}
				break;
			case 94:
				enterOuterAlt(_localctx, 94);
				{
				setState(288);
				match(NORENT);
				}
				break;
			case 95:
				enterOuterAlt(_localctx, 95);
				{
				setState(289);
				_la = _input.LA(1);
				if ( !(_la==NOSEQ || _la==NOSEQUENCE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 96:
				enterOuterAlt(_localctx, 96);
				{
				setState(290);
				_la = _input.LA(1);
				if ( !(_la==NOS || _la==NOSOURCE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 97:
				enterOuterAlt(_localctx, 97);
				{
				setState(291);
				match(NOSPIE);
				}
				break;
			case 98:
				enterOuterAlt(_localctx, 98);
				{
				setState(292);
				match(NOSQL);
				}
				break;
			case 99:
				enterOuterAlt(_localctx, 99);
				{
				setState(293);
				_la = _input.LA(1);
				if ( !(_la==NOSQLC || _la==NOSQLCCSID) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 100:
				enterOuterAlt(_localctx, 100);
				{
				setState(294);
				_la = _input.LA(1);
				if ( !(_la==NOSSR || _la==NOSSRANGE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 101:
				enterOuterAlt(_localctx, 101);
				{
				setState(295);
				match(NOSTDTRUNC);
				}
				break;
			case 102:
				enterOuterAlt(_localctx, 102);
				{
				setState(296);
				_la = _input.LA(1);
				if ( !(_la==NOTERM || _la==NOTERMINAL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 103:
				enterOuterAlt(_localctx, 103);
				{
				setState(297);
				match(NOTEST);
				}
				break;
			case 104:
				enterOuterAlt(_localctx, 104);
				{
				setState(298);
				match(NOTHREAD);
				}
				break;
			case 105:
				enterOuterAlt(_localctx, 105);
				{
				setState(299);
				match(NOVBREF);
				}
				break;
			case 106:
				enterOuterAlt(_localctx, 106);
				{
				setState(300);
				_la = _input.LA(1);
				if ( !(_la==NOWD || _la==NOWORD) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 107:
				enterOuterAlt(_localctx, 107);
				{
				setState(301);
				match(NSEQ);
				}
				break;
			case 108:
				enterOuterAlt(_localctx, 108);
				{
				setState(302);
				_la = _input.LA(1);
				if ( !(_la==NS || _la==NSYMBOL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(303);
				match(LPARENCHAR);
				setState(304);
				_la = _input.LA(1);
				if ( !(_la==DBCS || _la==NAT || _la==NATIONAL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(305);
				match(RPARENCHAR);
				}
				break;
			case 109:
				enterOuterAlt(_localctx, 109);
				{
				setState(306);
				match(NOVBREF);
				}
				break;
			case 110:
				enterOuterAlt(_localctx, 110);
				{
				setState(307);
				_la = _input.LA(1);
				if ( !(_la==NOX || _la==NOXREF) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 111:
				enterOuterAlt(_localctx, 111);
				{
				setState(308);
				match(NOZWB);
				}
				break;
			case 112:
				enterOuterAlt(_localctx, 112);
				{
				setState(309);
				_la = _input.LA(1);
				if ( !(_la==NUM || _la==NUMBER) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 113:
				enterOuterAlt(_localctx, 113);
				{
				setState(310);
				match(NUMPROC);
				setState(311);
				match(LPARENCHAR);
				setState(312);
				_la = _input.LA(1);
				if ( !(_la==MIG || _la==NOPFD || _la==PFD) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(313);
				match(RPARENCHAR);
				}
				break;
			case 114:
				enterOuterAlt(_localctx, 114);
				{
				setState(314);
				_la = _input.LA(1);
				if ( !(_la==OBJ || _la==OBJECT) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 115:
				enterOuterAlt(_localctx, 115);
				{
				setState(315);
				_la = _input.LA(1);
				if ( !(_la==OFF || _la==OFFSET) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 116:
				enterOuterAlt(_localctx, 116);
				{
				setState(316);
				match(OPMARGINS);
				setState(317);
				match(LPARENCHAR);
				setState(318);
				literal();
				setState(319);
				match(COMMACHAR);
				setState(320);
				literal();
				setState(323);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==COMMACHAR) {
					{
					setState(321);
					match(COMMACHAR);
					setState(322);
					literal();
					}
				}

				setState(325);
				match(RPARENCHAR);
				}
				break;
			case 117:
				enterOuterAlt(_localctx, 117);
				{
				setState(327);
				match(OPSEQUENCE);
				setState(328);
				match(LPARENCHAR);
				setState(329);
				literal();
				setState(330);
				match(COMMACHAR);
				setState(331);
				literal();
				setState(332);
				match(RPARENCHAR);
				}
				break;
			case 118:
				enterOuterAlt(_localctx, 118);
				{
				setState(334);
				_la = _input.LA(1);
				if ( !(_la==OPT || _la==OPTIMIZE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(338);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
				case 1:
					{
					setState(335);
					match(LPARENCHAR);
					setState(336);
					_la = _input.LA(1);
					if ( !(_la==FULL || _la==STD) ) {
					_errHandler.recoverInline(this);
					}
					else {
						if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
						_errHandler.reportMatch(this);
						consume();
					}
					setState(337);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 119:
				enterOuterAlt(_localctx, 119);
				{
				setState(340);
				match(OPTFILE);
				}
				break;
			case 120:
				enterOuterAlt(_localctx, 120);
				{
				setState(341);
				match(OPTIONS);
				}
				break;
			case 121:
				enterOuterAlt(_localctx, 121);
				{
				setState(342);
				match(OP);
				}
				break;
			case 122:
				enterOuterAlt(_localctx, 122);
				{
				setState(343);
				_la = _input.LA(1);
				if ( !(_la==OUT || _la==OUTDD) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(344);
				match(LPARENCHAR);
				setState(345);
				cobolWord();
				setState(346);
				match(RPARENCHAR);
				}
				break;
			case 123:
				enterOuterAlt(_localctx, 123);
				{
				setState(348);
				_la = _input.LA(1);
				if ( !(_la==PGMN || _la==PGMNAME) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(349);
				match(LPARENCHAR);
				setState(350);
				_la = _input.LA(1);
				if ( !(_la==CO || _la==COMPAT || ((((_la - 86)) & ~0x3f) == 0 && ((1L << (_la - 86)) & ((1L << (LM - 86)) | (1L << (LONGMIXED - 86)) | (1L << (LONGUPPER - 86)) | (1L << (LU - 86)) | (1L << (MIXED - 86)))) != 0) || ((((_la - 257)) & ~0x3f) == 0 && ((1L << (_la - 257)) & ((1L << (UPPER - 257)) | (1L << (M_CHAR - 257)) | (1L << (U_CHAR - 257)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(351);
				match(RPARENCHAR);
				}
				break;
			case 124:
				enterOuterAlt(_localctx, 124);
				{
				setState(352);
				match(PROLOG);
				}
				break;
			case 125:
				enterOuterAlt(_localctx, 125);
				{
				setState(353);
				_la = _input.LA(1);
				if ( !(_la==QUOTE || _la==Q_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 126:
				enterOuterAlt(_localctx, 126);
				{
				setState(354);
				match(RENT);
				}
				break;
			case 127:
				enterOuterAlt(_localctx, 127);
				{
				setState(355);
				match(RMODE);
				setState(356);
				match(LPARENCHAR);
				setState(360);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case ANY:
					{
					setState(357);
					match(ANY);
					}
					break;
				case AUTO:
					{
					setState(358);
					match(AUTO);
					}
					break;
				case NONNUMERICLITERAL:
				case NUMERICLITERAL:
					{
					setState(359);
					literal();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(362);
				match(RPARENCHAR);
				}
				break;
			case 128:
				enterOuterAlt(_localctx, 128);
				{
				setState(363);
				_la = _input.LA(1);
				if ( !(_la==SEQ || _la==SEQUENCE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(370);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,21,_ctx) ) {
				case 1:
					{
					setState(364);
					match(LPARENCHAR);
					setState(365);
					literal();
					setState(366);
					match(COMMACHAR);
					setState(367);
					literal();
					setState(368);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 129:
				enterOuterAlt(_localctx, 129);
				{
				setState(372);
				_la = _input.LA(1);
				if ( !(_la==SIZE || _la==SZ) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(373);
				match(LPARENCHAR);
				setState(376);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case MAX:
					{
					setState(374);
					match(MAX);
					}
					break;
				case NONNUMERICLITERAL:
				case NUMERICLITERAL:
					{
					setState(375);
					literal();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(378);
				match(RPARENCHAR);
				}
				break;
			case 130:
				enterOuterAlt(_localctx, 130);
				{
				setState(379);
				_la = _input.LA(1);
				if ( !(_la==SOURCE || _la==S_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 131:
				enterOuterAlt(_localctx, 131);
				{
				setState(380);
				match(SP);
				}
				break;
			case 132:
				enterOuterAlt(_localctx, 132);
				{
				setState(381);
				match(SPACE);
				setState(382);
				match(LPARENCHAR);
				setState(383);
				literal();
				setState(384);
				match(RPARENCHAR);
				}
				break;
			case 133:
				enterOuterAlt(_localctx, 133);
				{
				setState(386);
				match(SPIE);
				}
				break;
			case 134:
				enterOuterAlt(_localctx, 134);
				{
				setState(387);
				match(SQL);
				setState(392);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,23,_ctx) ) {
				case 1:
					{
					setState(388);
					match(LPARENCHAR);
					setState(389);
					literal();
					setState(390);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 135:
				enterOuterAlt(_localctx, 135);
				{
				setState(394);
				_la = _input.LA(1);
				if ( !(_la==SQLC || _la==SQLCCSID) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 136:
				enterOuterAlt(_localctx, 136);
				{
				setState(395);
				_la = _input.LA(1);
				if ( !(_la==SSR || _la==SSRANGE) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 137:
				enterOuterAlt(_localctx, 137);
				{
				setState(396);
				match(SYSEIB);
				}
				break;
			case 138:
				enterOuterAlt(_localctx, 138);
				{
				setState(397);
				_la = _input.LA(1);
				if ( !(_la==TERM || _la==TERMINAL) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 139:
				enterOuterAlt(_localctx, 139);
				{
				setState(398);
				match(TEST);
				setState(416);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,29,_ctx) ) {
				case 1:
					{
					setState(399);
					match(LPARENCHAR);
					setState(401);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==HOOK || _la==NOHOOK) {
						{
						setState(400);
						_la = _input.LA(1);
						if ( !(_la==HOOK || _la==NOHOOK) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
					}

					setState(404);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,25,_ctx) ) {
					case 1:
						{
						setState(403);
						match(COMMACHAR);
						}
						break;
					}
					setState(407);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (((((_la - 169)) & ~0x3f) == 0 && ((1L << (_la - 169)) & ((1L << (NOSEP - 169)) | (1L << (NOSEPARATE - 169)) | (1L << (SEP - 169)) | (1L << (SEPARATE - 169)))) != 0)) {
						{
						setState(406);
						_la = _input.LA(1);
						if ( !(((((_la - 169)) & ~0x3f) == 0 && ((1L << (_la - 169)) & ((1L << (NOSEP - 169)) | (1L << (NOSEPARATE - 169)) | (1L << (SEP - 169)) | (1L << (SEPARATE - 169)))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
					}

					setState(410);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==COMMACHAR) {
						{
						setState(409);
						match(COMMACHAR);
						}
					}

					setState(413);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==EJPD || _la==NOEJPD) {
						{
						setState(412);
						_la = _input.LA(1);
						if ( !(_la==EJPD || _la==NOEJPD) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
					}

					setState(415);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 140:
				enterOuterAlt(_localctx, 140);
				{
				setState(418);
				match(THREAD);
				}
				break;
			case 141:
				enterOuterAlt(_localctx, 141);
				{
				setState(419);
				match(TRUNC);
				setState(420);
				match(LPARENCHAR);
				setState(421);
				_la = _input.LA(1);
				if ( !(_la==BIN || _la==OPT || _la==STD) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(422);
				match(RPARENCHAR);
				}
				break;
			case 142:
				enterOuterAlt(_localctx, 142);
				{
				setState(423);
				match(VBREF);
				}
				break;
			case 143:
				enterOuterAlt(_localctx, 143);
				{
				setState(424);
				_la = _input.LA(1);
				if ( !(_la==WD || _la==WORD) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(425);
				match(LPARENCHAR);
				setState(426);
				cobolWord();
				setState(427);
				match(RPARENCHAR);
				}
				break;
			case 144:
				enterOuterAlt(_localctx, 144);
				{
				setState(429);
				_la = _input.LA(1);
				if ( !(_la==XMLPARSE || _la==XP) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(430);
				match(LPARENCHAR);
				setState(431);
				_la = _input.LA(1);
				if ( !(_la==COMPAT || ((((_la - 262)) & ~0x3f) == 0 && ((1L << (_la - 262)) & ((1L << (XMLSS - 262)) | (1L << (C_CHAR - 262)) | (1L << (X_CHAR - 262)))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(432);
				match(RPARENCHAR);
				}
				break;
			case 145:
				enterOuterAlt(_localctx, 145);
				{
				setState(433);
				_la = _input.LA(1);
				if ( !(_la==XREF || _la==X_CHAR) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(439);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,31,_ctx) ) {
				case 1:
					{
					setState(434);
					match(LPARENCHAR);
					setState(436);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==FULL || _la==SHORT) {
						{
						setState(435);
						_la = _input.LA(1);
						if ( !(_la==FULL || _la==SHORT) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
					}

					setState(438);
					match(RPARENCHAR);
					}
					break;
				}
				}
				break;
			case 146:
				enterOuterAlt(_localctx, 146);
				{
				setState(441);
				_la = _input.LA(1);
				if ( !(_la==YEARWINDOW || _la==YW) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(442);
				match(LPARENCHAR);
				setState(443);
				literal();
				setState(444);
				match(RPARENCHAR);
				}
				break;
			case 147:
				enterOuterAlt(_localctx, 147);
				{
				setState(446);
				match(ZWB);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExecCicsStatementContext extends ParserRuleContext {
		public TerminalNode EXEC() { return getToken(CobolPreprocessorParser.EXEC, 0); }
		public TerminalNode CICS() { return getToken(CobolPreprocessorParser.CICS, 0); }
		public CharDataContext charData() {
			return getRuleContext(CharDataContext.class,0);
		}
		public TerminalNode END_EXEC() { return getToken(CobolPreprocessorParser.END_EXEC, 0); }
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public ExecCicsStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_execCicsStatement; }
	}

	public final ExecCicsStatementContext execCicsStatement() throws RecognitionException {
		ExecCicsStatementContext _localctx = new ExecCicsStatementContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_execCicsStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(449);
			match(EXEC);
			setState(450);
			match(CICS);
			setState(451);
			charData();
			setState(452);
			match(END_EXEC);
			setState(454);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,33,_ctx) ) {
			case 1:
				{
				setState(453);
				match(DOT);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExecSqlStatementContext extends ParserRuleContext {
		public TerminalNode EXEC() { return getToken(CobolPreprocessorParser.EXEC, 0); }
		public TerminalNode SQL() { return getToken(CobolPreprocessorParser.SQL, 0); }
		public TerminalNode END_EXEC() { return getToken(CobolPreprocessorParser.END_EXEC, 0); }
		public IncludeSourceContext includeSource() {
			return getRuleContext(IncludeSourceContext.class,0);
		}
		public CharDataSqlContext charDataSql() {
			return getRuleContext(CharDataSqlContext.class,0);
		}
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public ExecSqlStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_execSqlStatement; }
	}

	public final ExecSqlStatementContext execSqlStatement() throws RecognitionException {
		ExecSqlStatementContext _localctx = new ExecSqlStatementContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_execSqlStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(456);
			match(EXEC);
			setState(457);
			match(SQL);
			setState(460);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INCLUDE:
				{
				setState(458);
				includeSource();
				}
				break;
			case ADATA:
			case ADV:
			case ALIAS:
			case ANSI:
			case ANY:
			case APOST:
			case AR:
			case ARITH:
			case AUTO:
			case AWO:
			case BIN:
			case BLOCK0:
			case BUF:
			case BUFSIZE:
			case BY:
			case CBL:
			case CBLCARD:
			case CO:
			case COBOL2:
			case COBOL3:
			case CODEPAGE:
			case COMPAT:
			case COMPILE:
			case COPY:
			case CP:
			case CPP:
			case CPSM:
			case CS:
			case CURR:
			case CURRENCY:
			case DATA:
			case DATEPROC:
			case DBCS:
			case DD:
			case DEBUG:
			case DECK:
			case DIAGTRUNC:
			case DLI:
			case DLL:
			case DP:
			case DTR:
			case DU:
			case DUMP:
			case DYN:
			case DYNAM:
			case EDF:
			case EJECT:
			case EJPD:
			case EN:
			case ENGLISH:
			case EPILOG:
			case EXCI:
			case EXIT:
			case EXP:
			case EXPORTALL:
			case EXTEND:
			case FASTSRT:
			case FLAG:
			case FLAGSTD:
			case FSRT:
			case FULL:
			case GDS:
			case GRAPHIC:
			case HOOK:
			case IN:
			case INTDATE:
			case JA:
			case JP:
			case KA:
			case LANG:
			case LANGUAGE:
			case LC:
			case LENGTH:
			case LIB:
			case LILIAN:
			case LIN:
			case LINECOUNT:
			case LINKAGE:
			case LIST:
			case LM:
			case LONGMIXED:
			case LONGUPPER:
			case LPARENCHAR:
			case LU:
			case MAP:
			case MARGINS:
			case MAX:
			case MD:
			case MDECK:
			case MIG:
			case MIXED:
			case NAME:
			case NAT:
			case NATIONAL:
			case NATLANG:
			case NN:
			case NO:
			case NOADATA:
			case NOADV:
			case NOALIAS:
			case NOAWO:
			case NOBLOCK0:
			case NOC:
			case NOCBLCARD:
			case NOCICS:
			case NOCMPR2:
			case NOCOMPILE:
			case NOCPSM:
			case NOCURR:
			case NOCURRENCY:
			case NOD:
			case NODATEPROC:
			case NODBCS:
			case NODE:
			case NODEBUG:
			case NODECK:
			case NODIAGTRUNC:
			case NODLL:
			case NODU:
			case NODUMP:
			case NODP:
			case NODTR:
			case NODYN:
			case NODYNAM:
			case NOEDF:
			case NOEJPD:
			case NOEPILOG:
			case NOEXIT:
			case NOEXP:
			case NOEXPORTALL:
			case NOF:
			case NOFASTSRT:
			case NOFEPI:
			case NOFLAG:
			case NOFLAGMIG:
			case NOFLAGSTD:
			case NOFSRT:
			case NOGRAPHIC:
			case NOHOOK:
			case NOLENGTH:
			case NOLIB:
			case NOLINKAGE:
			case NOLIST:
			case NOMAP:
			case NOMD:
			case NOMDECK:
			case NONAME:
			case NONUM:
			case NONUMBER:
			case NOOBJ:
			case NOOBJECT:
			case NOOFF:
			case NOOFFSET:
			case NOOPSEQUENCE:
			case NOOPT:
			case NOOPTIMIZE:
			case NOOPTIONS:
			case NOP:
			case NOPFD:
			case NOPROLOG:
			case NORENT:
			case NOS:
			case NOSEP:
			case NOSEPARATE:
			case NOSEQ:
			case NOSOURCE:
			case NOSPIE:
			case NOSQL:
			case NOSQLC:
			case NOSQLCCSID:
			case NOSSR:
			case NOSSRANGE:
			case NOSTDTRUNC:
			case NOSEQUENCE:
			case NOTERM:
			case NOTERMINAL:
			case NOTEST:
			case NOTHREAD:
			case NOTRIG:
			case NOVBREF:
			case NOWORD:
			case NOX:
			case NOXREF:
			case NOZWB:
			case NS:
			case NSEQ:
			case NSYMBOL:
			case NUM:
			case NUMBER:
			case NUMPROC:
			case OBJ:
			case OBJECT:
			case OF:
			case OFF:
			case OFFSET:
			case ON:
			case OP:
			case OPMARGINS:
			case OPSEQUENCE:
			case OPT:
			case OPTFILE:
			case OPTIMIZE:
			case OPTIONS:
			case OUT:
			case OUTDD:
			case PFD:
			case PPTDBG:
			case PGMN:
			case PGMNAME:
			case PROCESS:
			case PROLOG:
			case QUOTE:
			case RENT:
			case REPLACE:
			case REPLACING:
			case RMODE:
			case RPARENCHAR:
			case SEP:
			case SEPARATE:
			case SEQ:
			case SEQUENCE:
			case SHORT:
			case SIZE:
			case SOURCE:
			case SP:
			case SPACE:
			case SPIE:
			case SQL:
			case SQLC:
			case SQLCCSID:
			case SS:
			case SSR:
			case SSRANGE:
			case STD:
			case SYSEIB:
			case SZ:
			case TERM:
			case TERMINAL:
			case TEST:
			case THREAD:
			case TITLE:
			case TRIG:
			case TRUNC:
			case UE:
			case UPPER:
			case VBREF:
			case WD:
			case XMLPARSE:
			case XMLSS:
			case XOPTS:
			case XREF:
			case YEARWINDOW:
			case YW:
			case ZWB:
			case C_CHAR:
			case D_CHAR:
			case E_CHAR:
			case F_CHAR:
			case H_CHAR:
			case I_CHAR:
			case M_CHAR:
			case N_CHAR:
			case Q_CHAR:
			case S_CHAR:
			case U_CHAR:
			case W_CHAR:
			case X_CHAR:
			case COMMACHAR:
			case DOT:
			case NONNUMERICLITERAL:
			case NUMERICLITERAL:
			case IDENTIFIER:
			case FILENAME:
			case NEWLINE:
			case TEXT:
				{
				setState(459);
				charDataSql();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(462);
			match(END_EXEC);
			setState(464);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,35,_ctx) ) {
			case 1:
				{
				setState(463);
				match(DOT);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExecSqlImsStatementContext extends ParserRuleContext {
		public TerminalNode EXEC() { return getToken(CobolPreprocessorParser.EXEC, 0); }
		public TerminalNode SQLIMS() { return getToken(CobolPreprocessorParser.SQLIMS, 0); }
		public CharDataContext charData() {
			return getRuleContext(CharDataContext.class,0);
		}
		public TerminalNode END_EXEC() { return getToken(CobolPreprocessorParser.END_EXEC, 0); }
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public ExecSqlImsStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_execSqlImsStatement; }
	}

	public final ExecSqlImsStatementContext execSqlImsStatement() throws RecognitionException {
		ExecSqlImsStatementContext _localctx = new ExecSqlImsStatementContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_execSqlImsStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(466);
			match(EXEC);
			setState(467);
			match(SQLIMS);
			setState(468);
			charData();
			setState(469);
			match(END_EXEC);
			setState(471);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,36,_ctx) ) {
			case 1:
				{
				setState(470);
				match(DOT);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IncludeSourceContext extends ParserRuleContext {
		public TerminalNode INCLUDE() { return getToken(CobolPreprocessorParser.INCLUDE, 0); }
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public IncludeSourceContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_includeSource; }
	}

	public final IncludeSourceContext includeSource() throws RecognitionException {
		IncludeSourceContext _localctx = new IncludeSourceContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_includeSource);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(473);
			match(INCLUDE);
			setState(474);
			copySource();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyStatementContext extends ParserRuleContext {
		public TerminalNode COPY() { return getToken(CobolPreprocessorParser.COPY, 0); }
		public CopySourceContext copySource() {
			return getRuleContext(CopySourceContext.class,0);
		}
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public List<DirectoryPhraseContext> directoryPhrase() {
			return getRuleContexts(DirectoryPhraseContext.class);
		}
		public DirectoryPhraseContext directoryPhrase(int i) {
			return getRuleContext(DirectoryPhraseContext.class,i);
		}
		public List<FamilyPhraseContext> familyPhrase() {
			return getRuleContexts(FamilyPhraseContext.class);
		}
		public FamilyPhraseContext familyPhrase(int i) {
			return getRuleContext(FamilyPhraseContext.class,i);
		}
		public List<ReplacingPhraseContext> replacingPhrase() {
			return getRuleContexts(ReplacingPhraseContext.class);
		}
		public ReplacingPhraseContext replacingPhrase(int i) {
			return getRuleContext(ReplacingPhraseContext.class,i);
		}
		public List<TerminalNode> SUPPRESS() { return getTokens(CobolPreprocessorParser.SUPPRESS); }
		public TerminalNode SUPPRESS(int i) {
			return getToken(CobolPreprocessorParser.SUPPRESS, i);
		}
		public CopyStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyStatement; }
	}

	public final CopyStatementContext copyStatement() throws RecognitionException {
		CopyStatementContext _localctx = new CopyStatementContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_copyStatement);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(476);
			match(COPY);
			setState(477);
			copySource();
			setState(492);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,39,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(481);
					_errHandler.sync(this);
					_la = _input.LA(1);
					while (_la==NEWLINE) {
						{
						{
						setState(478);
						match(NEWLINE);
						}
						}
						setState(483);
						_errHandler.sync(this);
						_la = _input.LA(1);
					}
					setState(488);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case IN:
					case OF:
						{
						setState(484);
						directoryPhrase();
						}
						break;
					case ON:
						{
						setState(485);
						familyPhrase();
						}
						break;
					case REPLACING:
						{
						setState(486);
						replacingPhrase();
						}
						break;
					case SUPPRESS:
						{
						setState(487);
						match(SUPPRESS);
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
					} 
				}
				setState(494);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,39,_ctx);
			}
			setState(498);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(495);
				match(NEWLINE);
				}
				}
				setState(500);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(501);
			match(DOT);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopySourceContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public FilenameContext filename() {
			return getRuleContext(FilenameContext.class,0);
		}
		public CopyLibraryContext copyLibrary() {
			return getRuleContext(CopyLibraryContext.class,0);
		}
		public TerminalNode OF() { return getToken(CobolPreprocessorParser.OF, 0); }
		public TerminalNode IN() { return getToken(CobolPreprocessorParser.IN, 0); }
		public CopySourceContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copySource; }
	}

	public final CopySourceContext copySource() throws RecognitionException {
		CopySourceContext _localctx = new CopySourceContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_copySource);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(506);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NONNUMERICLITERAL:
			case NUMERICLITERAL:
				{
				setState(503);
				literal();
				}
				break;
			case ADATA:
			case ADV:
			case ALIAS:
			case ANSI:
			case ANY:
			case APOST:
			case AR:
			case ARITH:
			case AUTO:
			case AWO:
			case BIN:
			case BLOCK0:
			case BUF:
			case BUFSIZE:
			case BY:
			case CBL:
			case CBLCARD:
			case CO:
			case COBOL2:
			case COBOL3:
			case CODEPAGE:
			case COMPAT:
			case COMPILE:
			case CP:
			case CPP:
			case CPSM:
			case CS:
			case CURR:
			case CURRENCY:
			case DATA:
			case DATEPROC:
			case DBCS:
			case DD:
			case DEBUG:
			case DECK:
			case DIAGTRUNC:
			case DLI:
			case DLL:
			case DP:
			case DTR:
			case DU:
			case DUMP:
			case DYN:
			case DYNAM:
			case EDF:
			case EJECT:
			case EJPD:
			case EN:
			case ENGLISH:
			case EPILOG:
			case EXCI:
			case EXIT:
			case EXP:
			case EXPORTALL:
			case EXTEND:
			case FASTSRT:
			case FLAG:
			case FLAGSTD:
			case FSRT:
			case FULL:
			case GDS:
			case GRAPHIC:
			case HOOK:
			case IN:
			case INTDATE:
			case JA:
			case JP:
			case KA:
			case LANG:
			case LANGUAGE:
			case LC:
			case LENGTH:
			case LIB:
			case LILIAN:
			case LIN:
			case LINECOUNT:
			case LINKAGE:
			case LIST:
			case LM:
			case LONGMIXED:
			case LONGUPPER:
			case LU:
			case MAP:
			case MARGINS:
			case MAX:
			case MD:
			case MDECK:
			case MIG:
			case MIXED:
			case NAME:
			case NAT:
			case NATIONAL:
			case NATLANG:
			case NN:
			case NO:
			case NOADATA:
			case NOADV:
			case NOALIAS:
			case NOAWO:
			case NOBLOCK0:
			case NOC:
			case NOCBLCARD:
			case NOCICS:
			case NOCMPR2:
			case NOCOMPILE:
			case NOCPSM:
			case NOCURR:
			case NOCURRENCY:
			case NOD:
			case NODATEPROC:
			case NODBCS:
			case NODE:
			case NODEBUG:
			case NODECK:
			case NODIAGTRUNC:
			case NODLL:
			case NODU:
			case NODUMP:
			case NODP:
			case NODTR:
			case NODYN:
			case NODYNAM:
			case NOEDF:
			case NOEJPD:
			case NOEPILOG:
			case NOEXIT:
			case NOEXP:
			case NOEXPORTALL:
			case NOF:
			case NOFASTSRT:
			case NOFEPI:
			case NOFLAG:
			case NOFLAGMIG:
			case NOFLAGSTD:
			case NOFSRT:
			case NOGRAPHIC:
			case NOHOOK:
			case NOLENGTH:
			case NOLIB:
			case NOLINKAGE:
			case NOLIST:
			case NOMAP:
			case NOMD:
			case NOMDECK:
			case NONAME:
			case NONUM:
			case NONUMBER:
			case NOOBJ:
			case NOOBJECT:
			case NOOFF:
			case NOOFFSET:
			case NOOPSEQUENCE:
			case NOOPT:
			case NOOPTIMIZE:
			case NOOPTIONS:
			case NOP:
			case NOPFD:
			case NOPROLOG:
			case NORENT:
			case NOS:
			case NOSEP:
			case NOSEPARATE:
			case NOSEQ:
			case NOSOURCE:
			case NOSPIE:
			case NOSQL:
			case NOSQLC:
			case NOSQLCCSID:
			case NOSSR:
			case NOSSRANGE:
			case NOSTDTRUNC:
			case NOSEQUENCE:
			case NOTERM:
			case NOTERMINAL:
			case NOTEST:
			case NOTHREAD:
			case NOTRIG:
			case NOVBREF:
			case NOWORD:
			case NOX:
			case NOXREF:
			case NOZWB:
			case NS:
			case NSEQ:
			case NSYMBOL:
			case NUM:
			case NUMBER:
			case NUMPROC:
			case OBJ:
			case OBJECT:
			case OF:
			case OFF:
			case OFFSET:
			case ON:
			case OP:
			case OPMARGINS:
			case OPSEQUENCE:
			case OPT:
			case OPTFILE:
			case OPTIMIZE:
			case OPTIONS:
			case OUT:
			case OUTDD:
			case PFD:
			case PPTDBG:
			case PGMN:
			case PGMNAME:
			case PROCESS:
			case PROLOG:
			case QUOTE:
			case RENT:
			case REPLACING:
			case RMODE:
			case SEP:
			case SEPARATE:
			case SEQ:
			case SEQUENCE:
			case SHORT:
			case SIZE:
			case SOURCE:
			case SP:
			case SPACE:
			case SPIE:
			case SQL:
			case SQLC:
			case SQLCCSID:
			case SS:
			case SSR:
			case SSRANGE:
			case STD:
			case SYSEIB:
			case SZ:
			case TERM:
			case TERMINAL:
			case TEST:
			case THREAD:
			case TITLE:
			case TRIG:
			case TRUNC:
			case UE:
			case UPPER:
			case VBREF:
			case WD:
			case XMLPARSE:
			case XMLSS:
			case XOPTS:
			case XREF:
			case YEARWINDOW:
			case YW:
			case ZWB:
			case C_CHAR:
			case D_CHAR:
			case E_CHAR:
			case F_CHAR:
			case H_CHAR:
			case I_CHAR:
			case M_CHAR:
			case N_CHAR:
			case Q_CHAR:
			case S_CHAR:
			case U_CHAR:
			case W_CHAR:
			case X_CHAR:
			case COMMACHAR:
			case IDENTIFIER:
				{
				setState(504);
				cobolWord();
				}
				break;
			case FILENAME:
				{
				setState(505);
				filename();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			setState(510);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,42,_ctx) ) {
			case 1:
				{
				setState(508);
				_la = _input.LA(1);
				if ( !(_la==IN || _la==OF) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(509);
				copyLibrary();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CopyLibraryContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public CopyLibraryContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_copyLibrary; }
	}

	public final CopyLibraryContext copyLibrary() throws RecognitionException {
		CopyLibraryContext _localctx = new CopyLibraryContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_copyLibrary);
		try {
			setState(514);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NONNUMERICLITERAL:
			case NUMERICLITERAL:
				enterOuterAlt(_localctx, 1);
				{
				setState(512);
				literal();
				}
				break;
			case ADATA:
			case ADV:
			case ALIAS:
			case ANSI:
			case ANY:
			case APOST:
			case AR:
			case ARITH:
			case AUTO:
			case AWO:
			case BIN:
			case BLOCK0:
			case BUF:
			case BUFSIZE:
			case BY:
			case CBL:
			case CBLCARD:
			case CO:
			case COBOL2:
			case COBOL3:
			case CODEPAGE:
			case COMPAT:
			case COMPILE:
			case CP:
			case CPP:
			case CPSM:
			case CS:
			case CURR:
			case CURRENCY:
			case DATA:
			case DATEPROC:
			case DBCS:
			case DD:
			case DEBUG:
			case DECK:
			case DIAGTRUNC:
			case DLI:
			case DLL:
			case DP:
			case DTR:
			case DU:
			case DUMP:
			case DYN:
			case DYNAM:
			case EDF:
			case EJECT:
			case EJPD:
			case EN:
			case ENGLISH:
			case EPILOG:
			case EXCI:
			case EXIT:
			case EXP:
			case EXPORTALL:
			case EXTEND:
			case FASTSRT:
			case FLAG:
			case FLAGSTD:
			case FSRT:
			case FULL:
			case GDS:
			case GRAPHIC:
			case HOOK:
			case IN:
			case INTDATE:
			case JA:
			case JP:
			case KA:
			case LANG:
			case LANGUAGE:
			case LC:
			case LENGTH:
			case LIB:
			case LILIAN:
			case LIN:
			case LINECOUNT:
			case LINKAGE:
			case LIST:
			case LM:
			case LONGMIXED:
			case LONGUPPER:
			case LU:
			case MAP:
			case MARGINS:
			case MAX:
			case MD:
			case MDECK:
			case MIG:
			case MIXED:
			case NAME:
			case NAT:
			case NATIONAL:
			case NATLANG:
			case NN:
			case NO:
			case NOADATA:
			case NOADV:
			case NOALIAS:
			case NOAWO:
			case NOBLOCK0:
			case NOC:
			case NOCBLCARD:
			case NOCICS:
			case NOCMPR2:
			case NOCOMPILE:
			case NOCPSM:
			case NOCURR:
			case NOCURRENCY:
			case NOD:
			case NODATEPROC:
			case NODBCS:
			case NODE:
			case NODEBUG:
			case NODECK:
			case NODIAGTRUNC:
			case NODLL:
			case NODU:
			case NODUMP:
			case NODP:
			case NODTR:
			case NODYN:
			case NODYNAM:
			case NOEDF:
			case NOEJPD:
			case NOEPILOG:
			case NOEXIT:
			case NOEXP:
			case NOEXPORTALL:
			case NOF:
			case NOFASTSRT:
			case NOFEPI:
			case NOFLAG:
			case NOFLAGMIG:
			case NOFLAGSTD:
			case NOFSRT:
			case NOGRAPHIC:
			case NOHOOK:
			case NOLENGTH:
			case NOLIB:
			case NOLINKAGE:
			case NOLIST:
			case NOMAP:
			case NOMD:
			case NOMDECK:
			case NONAME:
			case NONUM:
			case NONUMBER:
			case NOOBJ:
			case NOOBJECT:
			case NOOFF:
			case NOOFFSET:
			case NOOPSEQUENCE:
			case NOOPT:
			case NOOPTIMIZE:
			case NOOPTIONS:
			case NOP:
			case NOPFD:
			case NOPROLOG:
			case NORENT:
			case NOS:
			case NOSEP:
			case NOSEPARATE:
			case NOSEQ:
			case NOSOURCE:
			case NOSPIE:
			case NOSQL:
			case NOSQLC:
			case NOSQLCCSID:
			case NOSSR:
			case NOSSRANGE:
			case NOSTDTRUNC:
			case NOSEQUENCE:
			case NOTERM:
			case NOTERMINAL:
			case NOTEST:
			case NOTHREAD:
			case NOTRIG:
			case NOVBREF:
			case NOWORD:
			case NOX:
			case NOXREF:
			case NOZWB:
			case NS:
			case NSEQ:
			case NSYMBOL:
			case NUM:
			case NUMBER:
			case NUMPROC:
			case OBJ:
			case OBJECT:
			case OF:
			case OFF:
			case OFFSET:
			case ON:
			case OP:
			case OPMARGINS:
			case OPSEQUENCE:
			case OPT:
			case OPTFILE:
			case OPTIMIZE:
			case OPTIONS:
			case OUT:
			case OUTDD:
			case PFD:
			case PPTDBG:
			case PGMN:
			case PGMNAME:
			case PROCESS:
			case PROLOG:
			case QUOTE:
			case RENT:
			case REPLACING:
			case RMODE:
			case SEP:
			case SEPARATE:
			case SEQ:
			case SEQUENCE:
			case SHORT:
			case SIZE:
			case SOURCE:
			case SP:
			case SPACE:
			case SPIE:
			case SQL:
			case SQLC:
			case SQLCCSID:
			case SS:
			case SSR:
			case SSRANGE:
			case STD:
			case SYSEIB:
			case SZ:
			case TERM:
			case TERMINAL:
			case TEST:
			case THREAD:
			case TITLE:
			case TRIG:
			case TRUNC:
			case UE:
			case UPPER:
			case VBREF:
			case WD:
			case XMLPARSE:
			case XMLSS:
			case XOPTS:
			case XREF:
			case YEARWINDOW:
			case YW:
			case ZWB:
			case C_CHAR:
			case D_CHAR:
			case E_CHAR:
			case F_CHAR:
			case H_CHAR:
			case I_CHAR:
			case M_CHAR:
			case N_CHAR:
			case Q_CHAR:
			case S_CHAR:
			case U_CHAR:
			case W_CHAR:
			case X_CHAR:
			case COMMACHAR:
			case IDENTIFIER:
				enterOuterAlt(_localctx, 2);
				{
				setState(513);
				cobolWord();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplacingPhraseContext extends ParserRuleContext {
		public TerminalNode REPLACING() { return getToken(CobolPreprocessorParser.REPLACING, 0); }
		public List<ReplaceClauseContext> replaceClause() {
			return getRuleContexts(ReplaceClauseContext.class);
		}
		public ReplaceClauseContext replaceClause(int i) {
			return getRuleContext(ReplaceClauseContext.class,i);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public ReplacingPhraseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replacingPhrase; }
	}

	public final ReplacingPhraseContext replacingPhrase() throws RecognitionException {
		ReplacingPhraseContext _localctx = new ReplacingPhraseContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_replacingPhrase);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(516);
			match(REPLACING);
			setState(520);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(517);
				match(NEWLINE);
				}
				}
				setState(522);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(523);
			replaceClause();
			setState(532);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,46,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(525); 
					_errHandler.sync(this);
					_la = _input.LA(1);
					do {
						{
						{
						setState(524);
						match(NEWLINE);
						}
						}
						setState(527); 
						_errHandler.sync(this);
						_la = _input.LA(1);
					} while ( _la==NEWLINE );
					setState(529);
					replaceClause();
					}
					} 
				}
				setState(534);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,46,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceAreaContext extends ParserRuleContext {
		public ReplaceByStatementContext replaceByStatement() {
			return getRuleContext(ReplaceByStatementContext.class,0);
		}
		public List<CopyStatementContext> copyStatement() {
			return getRuleContexts(CopyStatementContext.class);
		}
		public CopyStatementContext copyStatement(int i) {
			return getRuleContext(CopyStatementContext.class,i);
		}
		public List<CharDataContext> charData() {
			return getRuleContexts(CharDataContext.class);
		}
		public CharDataContext charData(int i) {
			return getRuleContext(CharDataContext.class,i);
		}
		public ReplaceOffStatementContext replaceOffStatement() {
			return getRuleContext(ReplaceOffStatementContext.class,0);
		}
		public ReplaceAreaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceArea; }
	}

	public final ReplaceAreaContext replaceArea() throws RecognitionException {
		ReplaceAreaContext _localctx = new ReplaceAreaContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_replaceArea);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(535);
			replaceByStatement();
			setState(540);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,48,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					setState(538);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case COPY:
						{
						setState(536);
						copyStatement();
						}
						break;
					case ADATA:
					case ADV:
					case ALIAS:
					case ANSI:
					case ANY:
					case APOST:
					case AR:
					case ARITH:
					case AUTO:
					case AWO:
					case BIN:
					case BLOCK0:
					case BUF:
					case BUFSIZE:
					case BY:
					case CBL:
					case CBLCARD:
					case CO:
					case COBOL2:
					case COBOL3:
					case CODEPAGE:
					case COMPAT:
					case COMPILE:
					case CP:
					case CPP:
					case CPSM:
					case CS:
					case CURR:
					case CURRENCY:
					case DATA:
					case DATEPROC:
					case DBCS:
					case DD:
					case DEBUG:
					case DECK:
					case DIAGTRUNC:
					case DLI:
					case DLL:
					case DP:
					case DTR:
					case DU:
					case DUMP:
					case DYN:
					case DYNAM:
					case EDF:
					case EJECT:
					case EJPD:
					case EN:
					case ENGLISH:
					case EPILOG:
					case EXCI:
					case EXIT:
					case EXP:
					case EXPORTALL:
					case EXTEND:
					case FASTSRT:
					case FLAG:
					case FLAGSTD:
					case FSRT:
					case FULL:
					case GDS:
					case GRAPHIC:
					case HOOK:
					case IN:
					case INTDATE:
					case JA:
					case JP:
					case KA:
					case LANG:
					case LANGUAGE:
					case LC:
					case LENGTH:
					case LIB:
					case LILIAN:
					case LIN:
					case LINECOUNT:
					case LINKAGE:
					case LIST:
					case LM:
					case LONGMIXED:
					case LONGUPPER:
					case LPARENCHAR:
					case LU:
					case MAP:
					case MARGINS:
					case MAX:
					case MD:
					case MDECK:
					case MIG:
					case MIXED:
					case NAME:
					case NAT:
					case NATIONAL:
					case NATLANG:
					case NN:
					case NO:
					case NOADATA:
					case NOADV:
					case NOALIAS:
					case NOAWO:
					case NOBLOCK0:
					case NOC:
					case NOCBLCARD:
					case NOCICS:
					case NOCMPR2:
					case NOCOMPILE:
					case NOCPSM:
					case NOCURR:
					case NOCURRENCY:
					case NOD:
					case NODATEPROC:
					case NODBCS:
					case NODE:
					case NODEBUG:
					case NODECK:
					case NODIAGTRUNC:
					case NODLL:
					case NODU:
					case NODUMP:
					case NODP:
					case NODTR:
					case NODYN:
					case NODYNAM:
					case NOEDF:
					case NOEJPD:
					case NOEPILOG:
					case NOEXIT:
					case NOEXP:
					case NOEXPORTALL:
					case NOF:
					case NOFASTSRT:
					case NOFEPI:
					case NOFLAG:
					case NOFLAGMIG:
					case NOFLAGSTD:
					case NOFSRT:
					case NOGRAPHIC:
					case NOHOOK:
					case NOLENGTH:
					case NOLIB:
					case NOLINKAGE:
					case NOLIST:
					case NOMAP:
					case NOMD:
					case NOMDECK:
					case NONAME:
					case NONUM:
					case NONUMBER:
					case NOOBJ:
					case NOOBJECT:
					case NOOFF:
					case NOOFFSET:
					case NOOPSEQUENCE:
					case NOOPT:
					case NOOPTIMIZE:
					case NOOPTIONS:
					case NOP:
					case NOPFD:
					case NOPROLOG:
					case NORENT:
					case NOS:
					case NOSEP:
					case NOSEPARATE:
					case NOSEQ:
					case NOSOURCE:
					case NOSPIE:
					case NOSQL:
					case NOSQLC:
					case NOSQLCCSID:
					case NOSSR:
					case NOSSRANGE:
					case NOSTDTRUNC:
					case NOSEQUENCE:
					case NOTERM:
					case NOTERMINAL:
					case NOTEST:
					case NOTHREAD:
					case NOTRIG:
					case NOVBREF:
					case NOWORD:
					case NOX:
					case NOXREF:
					case NOZWB:
					case NS:
					case NSEQ:
					case NSYMBOL:
					case NUM:
					case NUMBER:
					case NUMPROC:
					case OBJ:
					case OBJECT:
					case OF:
					case OFF:
					case OFFSET:
					case ON:
					case OP:
					case OPMARGINS:
					case OPSEQUENCE:
					case OPT:
					case OPTFILE:
					case OPTIMIZE:
					case OPTIONS:
					case OUT:
					case OUTDD:
					case PFD:
					case PPTDBG:
					case PGMN:
					case PGMNAME:
					case PROCESS:
					case PROLOG:
					case QUOTE:
					case RENT:
					case REPLACING:
					case RMODE:
					case RPARENCHAR:
					case SEP:
					case SEPARATE:
					case SEQ:
					case SEQUENCE:
					case SHORT:
					case SIZE:
					case SOURCE:
					case SP:
					case SPACE:
					case SPIE:
					case SQL:
					case SQLC:
					case SQLCCSID:
					case SS:
					case SSR:
					case SSRANGE:
					case STD:
					case SYSEIB:
					case SZ:
					case TERM:
					case TERMINAL:
					case TEST:
					case THREAD:
					case TITLE:
					case TRIG:
					case TRUNC:
					case UE:
					case UPPER:
					case VBREF:
					case WD:
					case XMLPARSE:
					case XMLSS:
					case XOPTS:
					case XREF:
					case YEARWINDOW:
					case YW:
					case ZWB:
					case C_CHAR:
					case D_CHAR:
					case E_CHAR:
					case F_CHAR:
					case H_CHAR:
					case I_CHAR:
					case M_CHAR:
					case N_CHAR:
					case Q_CHAR:
					case S_CHAR:
					case U_CHAR:
					case W_CHAR:
					case X_CHAR:
					case COMMACHAR:
					case DOT:
					case NONNUMERICLITERAL:
					case NUMERICLITERAL:
					case IDENTIFIER:
					case FILENAME:
					case NEWLINE:
					case TEXT:
						{
						setState(537);
						charData();
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					} 
				}
				setState(542);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,48,_ctx);
			}
			setState(544);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,49,_ctx) ) {
			case 1:
				{
				setState(543);
				replaceOffStatement();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceByStatementContext extends ParserRuleContext {
		public TerminalNode REPLACE() { return getToken(CobolPreprocessorParser.REPLACE, 0); }
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public List<ReplaceClauseContext> replaceClause() {
			return getRuleContexts(ReplaceClauseContext.class);
		}
		public ReplaceClauseContext replaceClause(int i) {
			return getRuleContext(ReplaceClauseContext.class,i);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public ReplaceByStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceByStatement; }
	}

	public final ReplaceByStatementContext replaceByStatement() throws RecognitionException {
		ReplaceByStatementContext _localctx = new ReplaceByStatementContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_replaceByStatement);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(546);
			match(REPLACE);
			setState(554); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					{
					setState(550);
					_errHandler.sync(this);
					_la = _input.LA(1);
					while (_la==NEWLINE) {
						{
						{
						setState(547);
						match(NEWLINE);
						}
						}
						setState(552);
						_errHandler.sync(this);
						_la = _input.LA(1);
					}
					setState(553);
					replaceClause();
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(556); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,51,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			setState(558);
			match(DOT);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceOffStatementContext extends ParserRuleContext {
		public TerminalNode REPLACE() { return getToken(CobolPreprocessorParser.REPLACE, 0); }
		public TerminalNode OFF() { return getToken(CobolPreprocessorParser.OFF, 0); }
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public ReplaceOffStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceOffStatement; }
	}

	public final ReplaceOffStatementContext replaceOffStatement() throws RecognitionException {
		ReplaceOffStatementContext _localctx = new ReplaceOffStatementContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_replaceOffStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(560);
			match(REPLACE);
			setState(561);
			match(OFF);
			setState(562);
			match(DOT);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceClauseContext extends ParserRuleContext {
		public ReplaceableContext replaceable() {
			return getRuleContext(ReplaceableContext.class,0);
		}
		public TerminalNode BY() { return getToken(CobolPreprocessorParser.BY, 0); }
		public ReplacementContext replacement() {
			return getRuleContext(ReplacementContext.class,0);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public DirectoryPhraseContext directoryPhrase() {
			return getRuleContext(DirectoryPhraseContext.class,0);
		}
		public FamilyPhraseContext familyPhrase() {
			return getRuleContext(FamilyPhraseContext.class,0);
		}
		public ReplaceClauseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceClause; }
	}

	public final ReplaceClauseContext replaceClause() throws RecognitionException {
		ReplaceClauseContext _localctx = new ReplaceClauseContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_replaceClause);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(564);
			replaceable();
			setState(568);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(565);
				match(NEWLINE);
				}
				}
				setState(570);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(571);
			match(BY);
			setState(575);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(572);
				match(NEWLINE);
				}
				}
				setState(577);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(578);
			replacement();
			setState(586);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,55,_ctx) ) {
			case 1:
				{
				setState(582);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==NEWLINE) {
					{
					{
					setState(579);
					match(NEWLINE);
					}
					}
					setState(584);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(585);
				directoryPhrase();
				}
				break;
			}
			setState(595);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,57,_ctx) ) {
			case 1:
				{
				setState(591);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==NEWLINE) {
					{
					{
					setState(588);
					match(NEWLINE);
					}
					}
					setState(593);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(594);
				familyPhrase();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DirectoryPhraseContext extends ParserRuleContext {
		public TerminalNode OF() { return getToken(CobolPreprocessorParser.OF, 0); }
		public TerminalNode IN() { return getToken(CobolPreprocessorParser.IN, 0); }
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public DirectoryPhraseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_directoryPhrase; }
	}

	public final DirectoryPhraseContext directoryPhrase() throws RecognitionException {
		DirectoryPhraseContext _localctx = new DirectoryPhraseContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_directoryPhrase);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(597);
			_la = _input.LA(1);
			if ( !(_la==IN || _la==OF) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(601);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(598);
				match(NEWLINE);
				}
				}
				setState(603);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(606);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NONNUMERICLITERAL:
			case NUMERICLITERAL:
				{
				setState(604);
				literal();
				}
				break;
			case ADATA:
			case ADV:
			case ALIAS:
			case ANSI:
			case ANY:
			case APOST:
			case AR:
			case ARITH:
			case AUTO:
			case AWO:
			case BIN:
			case BLOCK0:
			case BUF:
			case BUFSIZE:
			case BY:
			case CBL:
			case CBLCARD:
			case CO:
			case COBOL2:
			case COBOL3:
			case CODEPAGE:
			case COMPAT:
			case COMPILE:
			case CP:
			case CPP:
			case CPSM:
			case CS:
			case CURR:
			case CURRENCY:
			case DATA:
			case DATEPROC:
			case DBCS:
			case DD:
			case DEBUG:
			case DECK:
			case DIAGTRUNC:
			case DLI:
			case DLL:
			case DP:
			case DTR:
			case DU:
			case DUMP:
			case DYN:
			case DYNAM:
			case EDF:
			case EJECT:
			case EJPD:
			case EN:
			case ENGLISH:
			case EPILOG:
			case EXCI:
			case EXIT:
			case EXP:
			case EXPORTALL:
			case EXTEND:
			case FASTSRT:
			case FLAG:
			case FLAGSTD:
			case FSRT:
			case FULL:
			case GDS:
			case GRAPHIC:
			case HOOK:
			case IN:
			case INTDATE:
			case JA:
			case JP:
			case KA:
			case LANG:
			case LANGUAGE:
			case LC:
			case LENGTH:
			case LIB:
			case LILIAN:
			case LIN:
			case LINECOUNT:
			case LINKAGE:
			case LIST:
			case LM:
			case LONGMIXED:
			case LONGUPPER:
			case LU:
			case MAP:
			case MARGINS:
			case MAX:
			case MD:
			case MDECK:
			case MIG:
			case MIXED:
			case NAME:
			case NAT:
			case NATIONAL:
			case NATLANG:
			case NN:
			case NO:
			case NOADATA:
			case NOADV:
			case NOALIAS:
			case NOAWO:
			case NOBLOCK0:
			case NOC:
			case NOCBLCARD:
			case NOCICS:
			case NOCMPR2:
			case NOCOMPILE:
			case NOCPSM:
			case NOCURR:
			case NOCURRENCY:
			case NOD:
			case NODATEPROC:
			case NODBCS:
			case NODE:
			case NODEBUG:
			case NODECK:
			case NODIAGTRUNC:
			case NODLL:
			case NODU:
			case NODUMP:
			case NODP:
			case NODTR:
			case NODYN:
			case NODYNAM:
			case NOEDF:
			case NOEJPD:
			case NOEPILOG:
			case NOEXIT:
			case NOEXP:
			case NOEXPORTALL:
			case NOF:
			case NOFASTSRT:
			case NOFEPI:
			case NOFLAG:
			case NOFLAGMIG:
			case NOFLAGSTD:
			case NOFSRT:
			case NOGRAPHIC:
			case NOHOOK:
			case NOLENGTH:
			case NOLIB:
			case NOLINKAGE:
			case NOLIST:
			case NOMAP:
			case NOMD:
			case NOMDECK:
			case NONAME:
			case NONUM:
			case NONUMBER:
			case NOOBJ:
			case NOOBJECT:
			case NOOFF:
			case NOOFFSET:
			case NOOPSEQUENCE:
			case NOOPT:
			case NOOPTIMIZE:
			case NOOPTIONS:
			case NOP:
			case NOPFD:
			case NOPROLOG:
			case NORENT:
			case NOS:
			case NOSEP:
			case NOSEPARATE:
			case NOSEQ:
			case NOSOURCE:
			case NOSPIE:
			case NOSQL:
			case NOSQLC:
			case NOSQLCCSID:
			case NOSSR:
			case NOSSRANGE:
			case NOSTDTRUNC:
			case NOSEQUENCE:
			case NOTERM:
			case NOTERMINAL:
			case NOTEST:
			case NOTHREAD:
			case NOTRIG:
			case NOVBREF:
			case NOWORD:
			case NOX:
			case NOXREF:
			case NOZWB:
			case NS:
			case NSEQ:
			case NSYMBOL:
			case NUM:
			case NUMBER:
			case NUMPROC:
			case OBJ:
			case OBJECT:
			case OF:
			case OFF:
			case OFFSET:
			case ON:
			case OP:
			case OPMARGINS:
			case OPSEQUENCE:
			case OPT:
			case OPTFILE:
			case OPTIMIZE:
			case OPTIONS:
			case OUT:
			case OUTDD:
			case PFD:
			case PPTDBG:
			case PGMN:
			case PGMNAME:
			case PROCESS:
			case PROLOG:
			case QUOTE:
			case RENT:
			case REPLACING:
			case RMODE:
			case SEP:
			case SEPARATE:
			case SEQ:
			case SEQUENCE:
			case SHORT:
			case SIZE:
			case SOURCE:
			case SP:
			case SPACE:
			case SPIE:
			case SQL:
			case SQLC:
			case SQLCCSID:
			case SS:
			case SSR:
			case SSRANGE:
			case STD:
			case SYSEIB:
			case SZ:
			case TERM:
			case TERMINAL:
			case TEST:
			case THREAD:
			case TITLE:
			case TRIG:
			case TRUNC:
			case UE:
			case UPPER:
			case VBREF:
			case WD:
			case XMLPARSE:
			case XMLSS:
			case XOPTS:
			case XREF:
			case YEARWINDOW:
			case YW:
			case ZWB:
			case C_CHAR:
			case D_CHAR:
			case E_CHAR:
			case F_CHAR:
			case H_CHAR:
			case I_CHAR:
			case M_CHAR:
			case N_CHAR:
			case Q_CHAR:
			case S_CHAR:
			case U_CHAR:
			case W_CHAR:
			case X_CHAR:
			case COMMACHAR:
			case IDENTIFIER:
				{
				setState(605);
				cobolWord();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FamilyPhraseContext extends ParserRuleContext {
		public TerminalNode ON() { return getToken(CobolPreprocessorParser.ON, 0); }
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public FamilyPhraseContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_familyPhrase; }
	}

	public final FamilyPhraseContext familyPhrase() throws RecognitionException {
		FamilyPhraseContext _localctx = new FamilyPhraseContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_familyPhrase);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(608);
			match(ON);
			setState(612);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NEWLINE) {
				{
				{
				setState(609);
				match(NEWLINE);
				}
				}
				setState(614);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(617);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NONNUMERICLITERAL:
			case NUMERICLITERAL:
				{
				setState(615);
				literal();
				}
				break;
			case ADATA:
			case ADV:
			case ALIAS:
			case ANSI:
			case ANY:
			case APOST:
			case AR:
			case ARITH:
			case AUTO:
			case AWO:
			case BIN:
			case BLOCK0:
			case BUF:
			case BUFSIZE:
			case BY:
			case CBL:
			case CBLCARD:
			case CO:
			case COBOL2:
			case COBOL3:
			case CODEPAGE:
			case COMPAT:
			case COMPILE:
			case CP:
			case CPP:
			case CPSM:
			case CS:
			case CURR:
			case CURRENCY:
			case DATA:
			case DATEPROC:
			case DBCS:
			case DD:
			case DEBUG:
			case DECK:
			case DIAGTRUNC:
			case DLI:
			case DLL:
			case DP:
			case DTR:
			case DU:
			case DUMP:
			case DYN:
			case DYNAM:
			case EDF:
			case EJECT:
			case EJPD:
			case EN:
			case ENGLISH:
			case EPILOG:
			case EXCI:
			case EXIT:
			case EXP:
			case EXPORTALL:
			case EXTEND:
			case FASTSRT:
			case FLAG:
			case FLAGSTD:
			case FSRT:
			case FULL:
			case GDS:
			case GRAPHIC:
			case HOOK:
			case IN:
			case INTDATE:
			case JA:
			case JP:
			case KA:
			case LANG:
			case LANGUAGE:
			case LC:
			case LENGTH:
			case LIB:
			case LILIAN:
			case LIN:
			case LINECOUNT:
			case LINKAGE:
			case LIST:
			case LM:
			case LONGMIXED:
			case LONGUPPER:
			case LU:
			case MAP:
			case MARGINS:
			case MAX:
			case MD:
			case MDECK:
			case MIG:
			case MIXED:
			case NAME:
			case NAT:
			case NATIONAL:
			case NATLANG:
			case NN:
			case NO:
			case NOADATA:
			case NOADV:
			case NOALIAS:
			case NOAWO:
			case NOBLOCK0:
			case NOC:
			case NOCBLCARD:
			case NOCICS:
			case NOCMPR2:
			case NOCOMPILE:
			case NOCPSM:
			case NOCURR:
			case NOCURRENCY:
			case NOD:
			case NODATEPROC:
			case NODBCS:
			case NODE:
			case NODEBUG:
			case NODECK:
			case NODIAGTRUNC:
			case NODLL:
			case NODU:
			case NODUMP:
			case NODP:
			case NODTR:
			case NODYN:
			case NODYNAM:
			case NOEDF:
			case NOEJPD:
			case NOEPILOG:
			case NOEXIT:
			case NOEXP:
			case NOEXPORTALL:
			case NOF:
			case NOFASTSRT:
			case NOFEPI:
			case NOFLAG:
			case NOFLAGMIG:
			case NOFLAGSTD:
			case NOFSRT:
			case NOGRAPHIC:
			case NOHOOK:
			case NOLENGTH:
			case NOLIB:
			case NOLINKAGE:
			case NOLIST:
			case NOMAP:
			case NOMD:
			case NOMDECK:
			case NONAME:
			case NONUM:
			case NONUMBER:
			case NOOBJ:
			case NOOBJECT:
			case NOOFF:
			case NOOFFSET:
			case NOOPSEQUENCE:
			case NOOPT:
			case NOOPTIMIZE:
			case NOOPTIONS:
			case NOP:
			case NOPFD:
			case NOPROLOG:
			case NORENT:
			case NOS:
			case NOSEP:
			case NOSEPARATE:
			case NOSEQ:
			case NOSOURCE:
			case NOSPIE:
			case NOSQL:
			case NOSQLC:
			case NOSQLCCSID:
			case NOSSR:
			case NOSSRANGE:
			case NOSTDTRUNC:
			case NOSEQUENCE:
			case NOTERM:
			case NOTERMINAL:
			case NOTEST:
			case NOTHREAD:
			case NOTRIG:
			case NOVBREF:
			case NOWORD:
			case NOX:
			case NOXREF:
			case NOZWB:
			case NS:
			case NSEQ:
			case NSYMBOL:
			case NUM:
			case NUMBER:
			case NUMPROC:
			case OBJ:
			case OBJECT:
			case OF:
			case OFF:
			case OFFSET:
			case ON:
			case OP:
			case OPMARGINS:
			case OPSEQUENCE:
			case OPT:
			case OPTFILE:
			case OPTIMIZE:
			case OPTIONS:
			case OUT:
			case OUTDD:
			case PFD:
			case PPTDBG:
			case PGMN:
			case PGMNAME:
			case PROCESS:
			case PROLOG:
			case QUOTE:
			case RENT:
			case REPLACING:
			case RMODE:
			case SEP:
			case SEPARATE:
			case SEQ:
			case SEQUENCE:
			case SHORT:
			case SIZE:
			case SOURCE:
			case SP:
			case SPACE:
			case SPIE:
			case SQL:
			case SQLC:
			case SQLCCSID:
			case SS:
			case SSR:
			case SSRANGE:
			case STD:
			case SYSEIB:
			case SZ:
			case TERM:
			case TERMINAL:
			case TEST:
			case THREAD:
			case TITLE:
			case TRIG:
			case TRUNC:
			case UE:
			case UPPER:
			case VBREF:
			case WD:
			case XMLPARSE:
			case XMLSS:
			case XOPTS:
			case XREF:
			case YEARWINDOW:
			case YW:
			case ZWB:
			case C_CHAR:
			case D_CHAR:
			case E_CHAR:
			case F_CHAR:
			case H_CHAR:
			case I_CHAR:
			case M_CHAR:
			case N_CHAR:
			case Q_CHAR:
			case S_CHAR:
			case U_CHAR:
			case W_CHAR:
			case X_CHAR:
			case COMMACHAR:
			case IDENTIFIER:
				{
				setState(616);
				cobolWord();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplaceableContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public PseudoTextContext pseudoText() {
			return getRuleContext(PseudoTextContext.class,0);
		}
		public CharDataLineContext charDataLine() {
			return getRuleContext(CharDataLineContext.class,0);
		}
		public ReplaceableContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replaceable; }
	}

	public final ReplaceableContext replaceable() throws RecognitionException {
		ReplaceableContext _localctx = new ReplaceableContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_replaceable);
		try {
			setState(623);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,62,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(619);
				literal();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(620);
				cobolWord();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(621);
				pseudoText();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(622);
				charDataLine();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ReplacementContext extends ParserRuleContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public CobolWordContext cobolWord() {
			return getRuleContext(CobolWordContext.class,0);
		}
		public PseudoTextContext pseudoText() {
			return getRuleContext(PseudoTextContext.class,0);
		}
		public CharDataLineContext charDataLine() {
			return getRuleContext(CharDataLineContext.class,0);
		}
		public ReplacementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_replacement; }
	}

	public final ReplacementContext replacement() throws RecognitionException {
		ReplacementContext _localctx = new ReplacementContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_replacement);
		try {
			setState(629);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,63,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(625);
				literal();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(626);
				cobolWord();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(627);
				pseudoText();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(628);
				charDataLine();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class EjectStatementContext extends ParserRuleContext {
		public TerminalNode EJECT() { return getToken(CobolPreprocessorParser.EJECT, 0); }
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public EjectStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ejectStatement; }
	}

	public final EjectStatementContext ejectStatement() throws RecognitionException {
		EjectStatementContext _localctx = new EjectStatementContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_ejectStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(631);
			match(EJECT);
			setState(633);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,64,_ctx) ) {
			case 1:
				{
				setState(632);
				match(DOT);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SkipStatementContext extends ParserRuleContext {
		public TerminalNode SKIP1() { return getToken(CobolPreprocessorParser.SKIP1, 0); }
		public TerminalNode SKIP2() { return getToken(CobolPreprocessorParser.SKIP2, 0); }
		public TerminalNode SKIP3() { return getToken(CobolPreprocessorParser.SKIP3, 0); }
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public SkipStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_skipStatement; }
	}

	public final SkipStatementContext skipStatement() throws RecognitionException {
		SkipStatementContext _localctx = new SkipStatementContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_skipStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(635);
			_la = _input.LA(1);
			if ( !(((((_la - 239)) & ~0x3f) == 0 && ((1L << (_la - 239)) & ((1L << (SKIP1 - 239)) | (1L << (SKIP2 - 239)) | (1L << (SKIP3 - 239)))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(637);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,65,_ctx) ) {
			case 1:
				{
				setState(636);
				match(DOT);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TitleStatementContext extends ParserRuleContext {
		public TerminalNode TITLE() { return getToken(CobolPreprocessorParser.TITLE, 0); }
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public TerminalNode DOT() { return getToken(CobolPreprocessorParser.DOT, 0); }
		public TitleStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_titleStatement; }
	}

	public final TitleStatementContext titleStatement() throws RecognitionException {
		TitleStatementContext _localctx = new TitleStatementContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_titleStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(639);
			match(TITLE);
			setState(640);
			literal();
			setState(642);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,66,_ctx) ) {
			case 1:
				{
				setState(641);
				match(DOT);
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PseudoTextContext extends ParserRuleContext {
		public List<TerminalNode> DOUBLEEQUALCHAR() { return getTokens(CobolPreprocessorParser.DOUBLEEQUALCHAR); }
		public TerminalNode DOUBLEEQUALCHAR(int i) {
			return getToken(CobolPreprocessorParser.DOUBLEEQUALCHAR, i);
		}
		public CharDataContext charData() {
			return getRuleContext(CharDataContext.class,0);
		}
		public PseudoTextContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_pseudoText; }
	}

	public final PseudoTextContext pseudoText() throws RecognitionException {
		PseudoTextContext _localctx = new PseudoTextContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_pseudoText);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(644);
			match(DOUBLEEQUALCHAR);
			setState(646);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ADATA) | (1L << ADV) | (1L << ALIAS) | (1L << ANSI) | (1L << ANY) | (1L << APOST) | (1L << AR) | (1L << ARITH) | (1L << AUTO) | (1L << AWO) | (1L << BIN) | (1L << BLOCK0) | (1L << BUF) | (1L << BUFSIZE) | (1L << BY) | (1L << CBL) | (1L << CBLCARD) | (1L << CO) | (1L << COBOL2) | (1L << COBOL3) | (1L << CODEPAGE) | (1L << COMPAT) | (1L << COMPILE) | (1L << CP) | (1L << CPP) | (1L << CPSM) | (1L << CS) | (1L << CURR) | (1L << CURRENCY) | (1L << DATA) | (1L << DATEPROC) | (1L << DBCS) | (1L << DD) | (1L << DEBUG) | (1L << DECK) | (1L << DIAGTRUNC) | (1L << DLI) | (1L << DLL) | (1L << DP) | (1L << DTR) | (1L << DU) | (1L << DUMP) | (1L << DYN) | (1L << DYNAM) | (1L << EDF) | (1L << EJECT) | (1L << EJPD) | (1L << EN) | (1L << ENGLISH) | (1L << EPILOG) | (1L << EXCI) | (1L << EXIT) | (1L << EXP) | (1L << EXPORTALL) | (1L << EXTEND) | (1L << FASTSRT) | (1L << FLAG) | (1L << FLAGSTD))) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1L << (_la - 64)) & ((1L << (FSRT - 64)) | (1L << (FULL - 64)) | (1L << (GDS - 64)) | (1L << (GRAPHIC - 64)) | (1L << (HOOK - 64)) | (1L << (IN - 64)) | (1L << (INTDATE - 64)) | (1L << (JA - 64)) | (1L << (JP - 64)) | (1L << (KA - 64)) | (1L << (LANG - 64)) | (1L << (LANGUAGE - 64)) | (1L << (LC - 64)) | (1L << (LENGTH - 64)) | (1L << (LIB - 64)) | (1L << (LILIAN - 64)) | (1L << (LIN - 64)) | (1L << (LINECOUNT - 64)) | (1L << (LINKAGE - 64)) | (1L << (LIST - 64)) | (1L << (LM - 64)) | (1L << (LONGMIXED - 64)) | (1L << (LONGUPPER - 64)) | (1L << (LPARENCHAR - 64)) | (1L << (LU - 64)) | (1L << (MAP - 64)) | (1L << (MARGINS - 64)) | (1L << (MAX - 64)) | (1L << (MD - 64)) | (1L << (MDECK - 64)) | (1L << (MIG - 64)) | (1L << (MIXED - 64)) | (1L << (NAME - 64)) | (1L << (NAT - 64)) | (1L << (NATIONAL - 64)) | (1L << (NATLANG - 64)) | (1L << (NN - 64)) | (1L << (NO - 64)) | (1L << (NOADATA - 64)) | (1L << (NOADV - 64)) | (1L << (NOALIAS - 64)) | (1L << (NOAWO - 64)) | (1L << (NOBLOCK0 - 64)) | (1L << (NOC - 64)) | (1L << (NOCBLCARD - 64)) | (1L << (NOCICS - 64)) | (1L << (NOCMPR2 - 64)) | (1L << (NOCOMPILE - 64)) | (1L << (NOCPSM - 64)) | (1L << (NOCURR - 64)) | (1L << (NOCURRENCY - 64)) | (1L << (NOD - 64)) | (1L << (NODATEPROC - 64)) | (1L << (NODBCS - 64)) | (1L << (NODE - 64)) | (1L << (NODEBUG - 64)) | (1L << (NODECK - 64)) | (1L << (NODIAGTRUNC - 64)) | (1L << (NODLL - 64)) | (1L << (NODU - 64)) | (1L << (NODUMP - 64)) | (1L << (NODP - 64)))) != 0) || ((((_la - 128)) & ~0x3f) == 0 && ((1L << (_la - 128)) & ((1L << (NODTR - 128)) | (1L << (NODYN - 128)) | (1L << (NODYNAM - 128)) | (1L << (NOEDF - 128)) | (1L << (NOEJPD - 128)) | (1L << (NOEPILOG - 128)) | (1L << (NOEXIT - 128)) | (1L << (NOEXP - 128)) | (1L << (NOEXPORTALL - 128)) | (1L << (NOF - 128)) | (1L << (NOFASTSRT - 128)) | (1L << (NOFEPI - 128)) | (1L << (NOFLAG - 128)) | (1L << (NOFLAGMIG - 128)) | (1L << (NOFLAGSTD - 128)) | (1L << (NOFSRT - 128)) | (1L << (NOGRAPHIC - 128)) | (1L << (NOHOOK - 128)) | (1L << (NOLENGTH - 128)) | (1L << (NOLIB - 128)) | (1L << (NOLINKAGE - 128)) | (1L << (NOLIST - 128)) | (1L << (NOMAP - 128)) | (1L << (NOMD - 128)) | (1L << (NOMDECK - 128)) | (1L << (NONAME - 128)) | (1L << (NONUM - 128)) | (1L << (NONUMBER - 128)) | (1L << (NOOBJ - 128)) | (1L << (NOOBJECT - 128)) | (1L << (NOOFF - 128)) | (1L << (NOOFFSET - 128)) | (1L << (NOOPSEQUENCE - 128)) | (1L << (NOOPT - 128)) | (1L << (NOOPTIMIZE - 128)) | (1L << (NOOPTIONS - 128)) | (1L << (NOP - 128)) | (1L << (NOPFD - 128)) | (1L << (NOPROLOG - 128)) | (1L << (NORENT - 128)) | (1L << (NOS - 128)) | (1L << (NOSEP - 128)) | (1L << (NOSEPARATE - 128)) | (1L << (NOSEQ - 128)) | (1L << (NOSOURCE - 128)) | (1L << (NOSPIE - 128)) | (1L << (NOSQL - 128)) | (1L << (NOSQLC - 128)) | (1L << (NOSQLCCSID - 128)) | (1L << (NOSSR - 128)) | (1L << (NOSSRANGE - 128)) | (1L << (NOSTDTRUNC - 128)) | (1L << (NOSEQUENCE - 128)) | (1L << (NOTERM - 128)) | (1L << (NOTERMINAL - 128)) | (1L << (NOTEST - 128)) | (1L << (NOTHREAD - 128)) | (1L << (NOTRIG - 128)) | (1L << (NOVBREF - 128)) | (1L << (NOWORD - 128)) | (1L << (NOX - 128)) | (1L << (NOXREF - 128)) | (1L << (NOZWB - 128)))) != 0) || ((((_la - 192)) & ~0x3f) == 0 && ((1L << (_la - 192)) & ((1L << (NS - 192)) | (1L << (NSEQ - 192)) | (1L << (NSYMBOL - 192)) | (1L << (NUM - 192)) | (1L << (NUMBER - 192)) | (1L << (NUMPROC - 192)) | (1L << (OBJ - 192)) | (1L << (OBJECT - 192)) | (1L << (OF - 192)) | (1L << (OFF - 192)) | (1L << (OFFSET - 192)) | (1L << (ON - 192)) | (1L << (OP - 192)) | (1L << (OPMARGINS - 192)) | (1L << (OPSEQUENCE - 192)) | (1L << (OPT - 192)) | (1L << (OPTFILE - 192)) | (1L << (OPTIMIZE - 192)) | (1L << (OPTIONS - 192)) | (1L << (OUT - 192)) | (1L << (OUTDD - 192)) | (1L << (PFD - 192)) | (1L << (PPTDBG - 192)) | (1L << (PGMN - 192)) | (1L << (PGMNAME - 192)) | (1L << (PROCESS - 192)) | (1L << (PROLOG - 192)) | (1L << (QUOTE - 192)) | (1L << (RENT - 192)) | (1L << (REPLACING - 192)) | (1L << (RMODE - 192)) | (1L << (RPARENCHAR - 192)) | (1L << (SEP - 192)) | (1L << (SEPARATE - 192)) | (1L << (SEQ - 192)) | (1L << (SEQUENCE - 192)) | (1L << (SHORT - 192)) | (1L << (SIZE - 192)) | (1L << (SOURCE - 192)) | (1L << (SP - 192)) | (1L << (SPACE - 192)) | (1L << (SPIE - 192)) | (1L << (SQL - 192)) | (1L << (SQLC - 192)) | (1L << (SQLCCSID - 192)) | (1L << (SS - 192)) | (1L << (SSR - 192)) | (1L << (SSRANGE - 192)) | (1L << (STD - 192)) | (1L << (SYSEIB - 192)) | (1L << (SZ - 192)) | (1L << (TERM - 192)) | (1L << (TERMINAL - 192)) | (1L << (TEST - 192)) | (1L << (THREAD - 192)) | (1L << (TITLE - 192)) | (1L << (TRIG - 192)) | (1L << (TRUNC - 192)))) != 0) || ((((_la - 256)) & ~0x3f) == 0 && ((1L << (_la - 256)) & ((1L << (UE - 256)) | (1L << (UPPER - 256)) | (1L << (VBREF - 256)) | (1L << (WD - 256)) | (1L << (XMLPARSE - 256)) | (1L << (XMLSS - 256)) | (1L << (XOPTS - 256)) | (1L << (XREF - 256)) | (1L << (YEARWINDOW - 256)) | (1L << (YW - 256)) | (1L << (ZWB - 256)) | (1L << (C_CHAR - 256)) | (1L << (D_CHAR - 256)) | (1L << (E_CHAR - 256)) | (1L << (F_CHAR - 256)) | (1L << (H_CHAR - 256)) | (1L << (I_CHAR - 256)) | (1L << (M_CHAR - 256)) | (1L << (N_CHAR - 256)) | (1L << (Q_CHAR - 256)) | (1L << (S_CHAR - 256)) | (1L << (U_CHAR - 256)) | (1L << (W_CHAR - 256)) | (1L << (X_CHAR - 256)) | (1L << (COMMACHAR - 256)) | (1L << (DOT - 256)) | (1L << (NONNUMERICLITERAL - 256)) | (1L << (NUMERICLITERAL - 256)) | (1L << (IDENTIFIER - 256)) | (1L << (FILENAME - 256)) | (1L << (NEWLINE - 256)) | (1L << (TEXT - 256)))) != 0)) {
				{
				setState(645);
				charData();
				}
			}

			setState(648);
			match(DOUBLEEQUALCHAR);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CharDataContext extends ParserRuleContext {
		public List<CharDataLineContext> charDataLine() {
			return getRuleContexts(CharDataLineContext.class);
		}
		public CharDataLineContext charDataLine(int i) {
			return getRuleContext(CharDataLineContext.class,i);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public CharDataContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_charData; }
	}

	public final CharDataContext charData() throws RecognitionException {
		CharDataContext _localctx = new CharDataContext(_ctx, getState());
		enterRule(_localctx, 48, RULE_charData);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(652); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					setState(652);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case ADATA:
					case ADV:
					case ALIAS:
					case ANSI:
					case ANY:
					case APOST:
					case AR:
					case ARITH:
					case AUTO:
					case AWO:
					case BIN:
					case BLOCK0:
					case BUF:
					case BUFSIZE:
					case BY:
					case CBL:
					case CBLCARD:
					case CO:
					case COBOL2:
					case COBOL3:
					case CODEPAGE:
					case COMPAT:
					case COMPILE:
					case CP:
					case CPP:
					case CPSM:
					case CS:
					case CURR:
					case CURRENCY:
					case DATA:
					case DATEPROC:
					case DBCS:
					case DD:
					case DEBUG:
					case DECK:
					case DIAGTRUNC:
					case DLI:
					case DLL:
					case DP:
					case DTR:
					case DU:
					case DUMP:
					case DYN:
					case DYNAM:
					case EDF:
					case EJECT:
					case EJPD:
					case EN:
					case ENGLISH:
					case EPILOG:
					case EXCI:
					case EXIT:
					case EXP:
					case EXPORTALL:
					case EXTEND:
					case FASTSRT:
					case FLAG:
					case FLAGSTD:
					case FSRT:
					case FULL:
					case GDS:
					case GRAPHIC:
					case HOOK:
					case IN:
					case INTDATE:
					case JA:
					case JP:
					case KA:
					case LANG:
					case LANGUAGE:
					case LC:
					case LENGTH:
					case LIB:
					case LILIAN:
					case LIN:
					case LINECOUNT:
					case LINKAGE:
					case LIST:
					case LM:
					case LONGMIXED:
					case LONGUPPER:
					case LPARENCHAR:
					case LU:
					case MAP:
					case MARGINS:
					case MAX:
					case MD:
					case MDECK:
					case MIG:
					case MIXED:
					case NAME:
					case NAT:
					case NATIONAL:
					case NATLANG:
					case NN:
					case NO:
					case NOADATA:
					case NOADV:
					case NOALIAS:
					case NOAWO:
					case NOBLOCK0:
					case NOC:
					case NOCBLCARD:
					case NOCICS:
					case NOCMPR2:
					case NOCOMPILE:
					case NOCPSM:
					case NOCURR:
					case NOCURRENCY:
					case NOD:
					case NODATEPROC:
					case NODBCS:
					case NODE:
					case NODEBUG:
					case NODECK:
					case NODIAGTRUNC:
					case NODLL:
					case NODU:
					case NODUMP:
					case NODP:
					case NODTR:
					case NODYN:
					case NODYNAM:
					case NOEDF:
					case NOEJPD:
					case NOEPILOG:
					case NOEXIT:
					case NOEXP:
					case NOEXPORTALL:
					case NOF:
					case NOFASTSRT:
					case NOFEPI:
					case NOFLAG:
					case NOFLAGMIG:
					case NOFLAGSTD:
					case NOFSRT:
					case NOGRAPHIC:
					case NOHOOK:
					case NOLENGTH:
					case NOLIB:
					case NOLINKAGE:
					case NOLIST:
					case NOMAP:
					case NOMD:
					case NOMDECK:
					case NONAME:
					case NONUM:
					case NONUMBER:
					case NOOBJ:
					case NOOBJECT:
					case NOOFF:
					case NOOFFSET:
					case NOOPSEQUENCE:
					case NOOPT:
					case NOOPTIMIZE:
					case NOOPTIONS:
					case NOP:
					case NOPFD:
					case NOPROLOG:
					case NORENT:
					case NOS:
					case NOSEP:
					case NOSEPARATE:
					case NOSEQ:
					case NOSOURCE:
					case NOSPIE:
					case NOSQL:
					case NOSQLC:
					case NOSQLCCSID:
					case NOSSR:
					case NOSSRANGE:
					case NOSTDTRUNC:
					case NOSEQUENCE:
					case NOTERM:
					case NOTERMINAL:
					case NOTEST:
					case NOTHREAD:
					case NOTRIG:
					case NOVBREF:
					case NOWORD:
					case NOX:
					case NOXREF:
					case NOZWB:
					case NS:
					case NSEQ:
					case NSYMBOL:
					case NUM:
					case NUMBER:
					case NUMPROC:
					case OBJ:
					case OBJECT:
					case OF:
					case OFF:
					case OFFSET:
					case ON:
					case OP:
					case OPMARGINS:
					case OPSEQUENCE:
					case OPT:
					case OPTFILE:
					case OPTIMIZE:
					case OPTIONS:
					case OUT:
					case OUTDD:
					case PFD:
					case PPTDBG:
					case PGMN:
					case PGMNAME:
					case PROCESS:
					case PROLOG:
					case QUOTE:
					case RENT:
					case REPLACING:
					case RMODE:
					case RPARENCHAR:
					case SEP:
					case SEPARATE:
					case SEQ:
					case SEQUENCE:
					case SHORT:
					case SIZE:
					case SOURCE:
					case SP:
					case SPACE:
					case SPIE:
					case SQL:
					case SQLC:
					case SQLCCSID:
					case SS:
					case SSR:
					case SSRANGE:
					case STD:
					case SYSEIB:
					case SZ:
					case TERM:
					case TERMINAL:
					case TEST:
					case THREAD:
					case TITLE:
					case TRIG:
					case TRUNC:
					case UE:
					case UPPER:
					case VBREF:
					case WD:
					case XMLPARSE:
					case XMLSS:
					case XOPTS:
					case XREF:
					case YEARWINDOW:
					case YW:
					case ZWB:
					case C_CHAR:
					case D_CHAR:
					case E_CHAR:
					case F_CHAR:
					case H_CHAR:
					case I_CHAR:
					case M_CHAR:
					case N_CHAR:
					case Q_CHAR:
					case S_CHAR:
					case U_CHAR:
					case W_CHAR:
					case X_CHAR:
					case COMMACHAR:
					case DOT:
					case NONNUMERICLITERAL:
					case NUMERICLITERAL:
					case IDENTIFIER:
					case FILENAME:
					case TEXT:
						{
						setState(650);
						charDataLine();
						}
						break;
					case NEWLINE:
						{
						setState(651);
						match(NEWLINE);
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(654); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,69,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CharDataSqlContext extends ParserRuleContext {
		public List<CharDataLineContext> charDataLine() {
			return getRuleContexts(CharDataLineContext.class);
		}
		public CharDataLineContext charDataLine(int i) {
			return getRuleContext(CharDataLineContext.class,i);
		}
		public List<TerminalNode> COPY() { return getTokens(CobolPreprocessorParser.COPY); }
		public TerminalNode COPY(int i) {
			return getToken(CobolPreprocessorParser.COPY, i);
		}
		public List<TerminalNode> REPLACE() { return getTokens(CobolPreprocessorParser.REPLACE); }
		public TerminalNode REPLACE(int i) {
			return getToken(CobolPreprocessorParser.REPLACE, i);
		}
		public List<TerminalNode> NEWLINE() { return getTokens(CobolPreprocessorParser.NEWLINE); }
		public TerminalNode NEWLINE(int i) {
			return getToken(CobolPreprocessorParser.NEWLINE, i);
		}
		public CharDataSqlContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_charDataSql; }
	}

	public final CharDataSqlContext charDataSql() throws RecognitionException {
		CharDataSqlContext _localctx = new CharDataSqlContext(_ctx, getState());
		enterRule(_localctx, 50, RULE_charDataSql);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(660); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				setState(660);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case ADATA:
				case ADV:
				case ALIAS:
				case ANSI:
				case ANY:
				case APOST:
				case AR:
				case ARITH:
				case AUTO:
				case AWO:
				case BIN:
				case BLOCK0:
				case BUF:
				case BUFSIZE:
				case BY:
				case CBL:
				case CBLCARD:
				case CO:
				case COBOL2:
				case COBOL3:
				case CODEPAGE:
				case COMPAT:
				case COMPILE:
				case CP:
				case CPP:
				case CPSM:
				case CS:
				case CURR:
				case CURRENCY:
				case DATA:
				case DATEPROC:
				case DBCS:
				case DD:
				case DEBUG:
				case DECK:
				case DIAGTRUNC:
				case DLI:
				case DLL:
				case DP:
				case DTR:
				case DU:
				case DUMP:
				case DYN:
				case DYNAM:
				case EDF:
				case EJECT:
				case EJPD:
				case EN:
				case ENGLISH:
				case EPILOG:
				case EXCI:
				case EXIT:
				case EXP:
				case EXPORTALL:
				case EXTEND:
				case FASTSRT:
				case FLAG:
				case FLAGSTD:
				case FSRT:
				case FULL:
				case GDS:
				case GRAPHIC:
				case HOOK:
				case IN:
				case INTDATE:
				case JA:
				case JP:
				case KA:
				case LANG:
				case LANGUAGE:
				case LC:
				case LENGTH:
				case LIB:
				case LILIAN:
				case LIN:
				case LINECOUNT:
				case LINKAGE:
				case LIST:
				case LM:
				case LONGMIXED:
				case LONGUPPER:
				case LPARENCHAR:
				case LU:
				case MAP:
				case MARGINS:
				case MAX:
				case MD:
				case MDECK:
				case MIG:
				case MIXED:
				case NAME:
				case NAT:
				case NATIONAL:
				case NATLANG:
				case NN:
				case NO:
				case NOADATA:
				case NOADV:
				case NOALIAS:
				case NOAWO:
				case NOBLOCK0:
				case NOC:
				case NOCBLCARD:
				case NOCICS:
				case NOCMPR2:
				case NOCOMPILE:
				case NOCPSM:
				case NOCURR:
				case NOCURRENCY:
				case NOD:
				case NODATEPROC:
				case NODBCS:
				case NODE:
				case NODEBUG:
				case NODECK:
				case NODIAGTRUNC:
				case NODLL:
				case NODU:
				case NODUMP:
				case NODP:
				case NODTR:
				case NODYN:
				case NODYNAM:
				case NOEDF:
				case NOEJPD:
				case NOEPILOG:
				case NOEXIT:
				case NOEXP:
				case NOEXPORTALL:
				case NOF:
				case NOFASTSRT:
				case NOFEPI:
				case NOFLAG:
				case NOFLAGMIG:
				case NOFLAGSTD:
				case NOFSRT:
				case NOGRAPHIC:
				case NOHOOK:
				case NOLENGTH:
				case NOLIB:
				case NOLINKAGE:
				case NOLIST:
				case NOMAP:
				case NOMD:
				case NOMDECK:
				case NONAME:
				case NONUM:
				case NONUMBER:
				case NOOBJ:
				case NOOBJECT:
				case NOOFF:
				case NOOFFSET:
				case NOOPSEQUENCE:
				case NOOPT:
				case NOOPTIMIZE:
				case NOOPTIONS:
				case NOP:
				case NOPFD:
				case NOPROLOG:
				case NORENT:
				case NOS:
				case NOSEP:
				case NOSEPARATE:
				case NOSEQ:
				case NOSOURCE:
				case NOSPIE:
				case NOSQL:
				case NOSQLC:
				case NOSQLCCSID:
				case NOSSR:
				case NOSSRANGE:
				case NOSTDTRUNC:
				case NOSEQUENCE:
				case NOTERM:
				case NOTERMINAL:
				case NOTEST:
				case NOTHREAD:
				case NOTRIG:
				case NOVBREF:
				case NOWORD:
				case NOX:
				case NOXREF:
				case NOZWB:
				case NS:
				case NSEQ:
				case NSYMBOL:
				case NUM:
				case NUMBER:
				case NUMPROC:
				case OBJ:
				case OBJECT:
				case OF:
				case OFF:
				case OFFSET:
				case ON:
				case OP:
				case OPMARGINS:
				case OPSEQUENCE:
				case OPT:
				case OPTFILE:
				case OPTIMIZE:
				case OPTIONS:
				case OUT:
				case OUTDD:
				case PFD:
				case PPTDBG:
				case PGMN:
				case PGMNAME:
				case PROCESS:
				case PROLOG:
				case QUOTE:
				case RENT:
				case REPLACING:
				case RMODE:
				case RPARENCHAR:
				case SEP:
				case SEPARATE:
				case SEQ:
				case SEQUENCE:
				case SHORT:
				case SIZE:
				case SOURCE:
				case SP:
				case SPACE:
				case SPIE:
				case SQL:
				case SQLC:
				case SQLCCSID:
				case SS:
				case SSR:
				case SSRANGE:
				case STD:
				case SYSEIB:
				case SZ:
				case TERM:
				case TERMINAL:
				case TEST:
				case THREAD:
				case TITLE:
				case TRIG:
				case TRUNC:
				case UE:
				case UPPER:
				case VBREF:
				case WD:
				case XMLPARSE:
				case XMLSS:
				case XOPTS:
				case XREF:
				case YEARWINDOW:
				case YW:
				case ZWB:
				case C_CHAR:
				case D_CHAR:
				case E_CHAR:
				case F_CHAR:
				case H_CHAR:
				case I_CHAR:
				case M_CHAR:
				case N_CHAR:
				case Q_CHAR:
				case S_CHAR:
				case U_CHAR:
				case W_CHAR:
				case X_CHAR:
				case COMMACHAR:
				case DOT:
				case NONNUMERICLITERAL:
				case NUMERICLITERAL:
				case IDENTIFIER:
				case FILENAME:
				case TEXT:
					{
					setState(656);
					charDataLine();
					}
					break;
				case COPY:
					{
					setState(657);
					match(COPY);
					}
					break;
				case REPLACE:
					{
					setState(658);
					match(REPLACE);
					}
					break;
				case NEWLINE:
					{
					setState(659);
					match(NEWLINE);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				setState(662); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ADATA) | (1L << ADV) | (1L << ALIAS) | (1L << ANSI) | (1L << ANY) | (1L << APOST) | (1L << AR) | (1L << ARITH) | (1L << AUTO) | (1L << AWO) | (1L << BIN) | (1L << BLOCK0) | (1L << BUF) | (1L << BUFSIZE) | (1L << BY) | (1L << CBL) | (1L << CBLCARD) | (1L << CO) | (1L << COBOL2) | (1L << COBOL3) | (1L << CODEPAGE) | (1L << COMPAT) | (1L << COMPILE) | (1L << COPY) | (1L << CP) | (1L << CPP) | (1L << CPSM) | (1L << CS) | (1L << CURR) | (1L << CURRENCY) | (1L << DATA) | (1L << DATEPROC) | (1L << DBCS) | (1L << DD) | (1L << DEBUG) | (1L << DECK) | (1L << DIAGTRUNC) | (1L << DLI) | (1L << DLL) | (1L << DP) | (1L << DTR) | (1L << DU) | (1L << DUMP) | (1L << DYN) | (1L << DYNAM) | (1L << EDF) | (1L << EJECT) | (1L << EJPD) | (1L << EN) | (1L << ENGLISH) | (1L << EPILOG) | (1L << EXCI) | (1L << EXIT) | (1L << EXP) | (1L << EXPORTALL) | (1L << EXTEND) | (1L << FASTSRT) | (1L << FLAG) | (1L << FLAGSTD))) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1L << (_la - 64)) & ((1L << (FSRT - 64)) | (1L << (FULL - 64)) | (1L << (GDS - 64)) | (1L << (GRAPHIC - 64)) | (1L << (HOOK - 64)) | (1L << (IN - 64)) | (1L << (INTDATE - 64)) | (1L << (JA - 64)) | (1L << (JP - 64)) | (1L << (KA - 64)) | (1L << (LANG - 64)) | (1L << (LANGUAGE - 64)) | (1L << (LC - 64)) | (1L << (LENGTH - 64)) | (1L << (LIB - 64)) | (1L << (LILIAN - 64)) | (1L << (LIN - 64)) | (1L << (LINECOUNT - 64)) | (1L << (LINKAGE - 64)) | (1L << (LIST - 64)) | (1L << (LM - 64)) | (1L << (LONGMIXED - 64)) | (1L << (LONGUPPER - 64)) | (1L << (LPARENCHAR - 64)) | (1L << (LU - 64)) | (1L << (MAP - 64)) | (1L << (MARGINS - 64)) | (1L << (MAX - 64)) | (1L << (MD - 64)) | (1L << (MDECK - 64)) | (1L << (MIG - 64)) | (1L << (MIXED - 64)) | (1L << (NAME - 64)) | (1L << (NAT - 64)) | (1L << (NATIONAL - 64)) | (1L << (NATLANG - 64)) | (1L << (NN - 64)) | (1L << (NO - 64)) | (1L << (NOADATA - 64)) | (1L << (NOADV - 64)) | (1L << (NOALIAS - 64)) | (1L << (NOAWO - 64)) | (1L << (NOBLOCK0 - 64)) | (1L << (NOC - 64)) | (1L << (NOCBLCARD - 64)) | (1L << (NOCICS - 64)) | (1L << (NOCMPR2 - 64)) | (1L << (NOCOMPILE - 64)) | (1L << (NOCPSM - 64)) | (1L << (NOCURR - 64)) | (1L << (NOCURRENCY - 64)) | (1L << (NOD - 64)) | (1L << (NODATEPROC - 64)) | (1L << (NODBCS - 64)) | (1L << (NODE - 64)) | (1L << (NODEBUG - 64)) | (1L << (NODECK - 64)) | (1L << (NODIAGTRUNC - 64)) | (1L << (NODLL - 64)) | (1L << (NODU - 64)) | (1L << (NODUMP - 64)) | (1L << (NODP - 64)))) != 0) || ((((_la - 128)) & ~0x3f) == 0 && ((1L << (_la - 128)) & ((1L << (NODTR - 128)) | (1L << (NODYN - 128)) | (1L << (NODYNAM - 128)) | (1L << (NOEDF - 128)) | (1L << (NOEJPD - 128)) | (1L << (NOEPILOG - 128)) | (1L << (NOEXIT - 128)) | (1L << (NOEXP - 128)) | (1L << (NOEXPORTALL - 128)) | (1L << (NOF - 128)) | (1L << (NOFASTSRT - 128)) | (1L << (NOFEPI - 128)) | (1L << (NOFLAG - 128)) | (1L << (NOFLAGMIG - 128)) | (1L << (NOFLAGSTD - 128)) | (1L << (NOFSRT - 128)) | (1L << (NOGRAPHIC - 128)) | (1L << (NOHOOK - 128)) | (1L << (NOLENGTH - 128)) | (1L << (NOLIB - 128)) | (1L << (NOLINKAGE - 128)) | (1L << (NOLIST - 128)) | (1L << (NOMAP - 128)) | (1L << (NOMD - 128)) | (1L << (NOMDECK - 128)) | (1L << (NONAME - 128)) | (1L << (NONUM - 128)) | (1L << (NONUMBER - 128)) | (1L << (NOOBJ - 128)) | (1L << (NOOBJECT - 128)) | (1L << (NOOFF - 128)) | (1L << (NOOFFSET - 128)) | (1L << (NOOPSEQUENCE - 128)) | (1L << (NOOPT - 128)) | (1L << (NOOPTIMIZE - 128)) | (1L << (NOOPTIONS - 128)) | (1L << (NOP - 128)) | (1L << (NOPFD - 128)) | (1L << (NOPROLOG - 128)) | (1L << (NORENT - 128)) | (1L << (NOS - 128)) | (1L << (NOSEP - 128)) | (1L << (NOSEPARATE - 128)) | (1L << (NOSEQ - 128)) | (1L << (NOSOURCE - 128)) | (1L << (NOSPIE - 128)) | (1L << (NOSQL - 128)) | (1L << (NOSQLC - 128)) | (1L << (NOSQLCCSID - 128)) | (1L << (NOSSR - 128)) | (1L << (NOSSRANGE - 128)) | (1L << (NOSTDTRUNC - 128)) | (1L << (NOSEQUENCE - 128)) | (1L << (NOTERM - 128)) | (1L << (NOTERMINAL - 128)) | (1L << (NOTEST - 128)) | (1L << (NOTHREAD - 128)) | (1L << (NOTRIG - 128)) | (1L << (NOVBREF - 128)) | (1L << (NOWORD - 128)) | (1L << (NOX - 128)) | (1L << (NOXREF - 128)) | (1L << (NOZWB - 128)))) != 0) || ((((_la - 192)) & ~0x3f) == 0 && ((1L << (_la - 192)) & ((1L << (NS - 192)) | (1L << (NSEQ - 192)) | (1L << (NSYMBOL - 192)) | (1L << (NUM - 192)) | (1L << (NUMBER - 192)) | (1L << (NUMPROC - 192)) | (1L << (OBJ - 192)) | (1L << (OBJECT - 192)) | (1L << (OF - 192)) | (1L << (OFF - 192)) | (1L << (OFFSET - 192)) | (1L << (ON - 192)) | (1L << (OP - 192)) | (1L << (OPMARGINS - 192)) | (1L << (OPSEQUENCE - 192)) | (1L << (OPT - 192)) | (1L << (OPTFILE - 192)) | (1L << (OPTIMIZE - 192)) | (1L << (OPTIONS - 192)) | (1L << (OUT - 192)) | (1L << (OUTDD - 192)) | (1L << (PFD - 192)) | (1L << (PPTDBG - 192)) | (1L << (PGMN - 192)) | (1L << (PGMNAME - 192)) | (1L << (PROCESS - 192)) | (1L << (PROLOG - 192)) | (1L << (QUOTE - 192)) | (1L << (RENT - 192)) | (1L << (REPLACE - 192)) | (1L << (REPLACING - 192)) | (1L << (RMODE - 192)) | (1L << (RPARENCHAR - 192)) | (1L << (SEP - 192)) | (1L << (SEPARATE - 192)) | (1L << (SEQ - 192)) | (1L << (SEQUENCE - 192)) | (1L << (SHORT - 192)) | (1L << (SIZE - 192)) | (1L << (SOURCE - 192)) | (1L << (SP - 192)) | (1L << (SPACE - 192)) | (1L << (SPIE - 192)) | (1L << (SQL - 192)) | (1L << (SQLC - 192)) | (1L << (SQLCCSID - 192)) | (1L << (SS - 192)) | (1L << (SSR - 192)) | (1L << (SSRANGE - 192)) | (1L << (STD - 192)) | (1L << (SYSEIB - 192)) | (1L << (SZ - 192)) | (1L << (TERM - 192)) | (1L << (TERMINAL - 192)) | (1L << (TEST - 192)) | (1L << (THREAD - 192)) | (1L << (TITLE - 192)) | (1L << (TRIG - 192)) | (1L << (TRUNC - 192)))) != 0) || ((((_la - 256)) & ~0x3f) == 0 && ((1L << (_la - 256)) & ((1L << (UE - 256)) | (1L << (UPPER - 256)) | (1L << (VBREF - 256)) | (1L << (WD - 256)) | (1L << (XMLPARSE - 256)) | (1L << (XMLSS - 256)) | (1L << (XOPTS - 256)) | (1L << (XREF - 256)) | (1L << (YEARWINDOW - 256)) | (1L << (YW - 256)) | (1L << (ZWB - 256)) | (1L << (C_CHAR - 256)) | (1L << (D_CHAR - 256)) | (1L << (E_CHAR - 256)) | (1L << (F_CHAR - 256)) | (1L << (H_CHAR - 256)) | (1L << (I_CHAR - 256)) | (1L << (M_CHAR - 256)) | (1L << (N_CHAR - 256)) | (1L << (Q_CHAR - 256)) | (1L << (S_CHAR - 256)) | (1L << (U_CHAR - 256)) | (1L << (W_CHAR - 256)) | (1L << (X_CHAR - 256)) | (1L << (COMMACHAR - 256)) | (1L << (DOT - 256)) | (1L << (NONNUMERICLITERAL - 256)) | (1L << (NUMERICLITERAL - 256)) | (1L << (IDENTIFIER - 256)) | (1L << (FILENAME - 256)) | (1L << (NEWLINE - 256)) | (1L << (TEXT - 256)))) != 0) );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CharDataLineContext extends ParserRuleContext {
		public List<CobolWordContext> cobolWord() {
			return getRuleContexts(CobolWordContext.class);
		}
		public CobolWordContext cobolWord(int i) {
			return getRuleContext(CobolWordContext.class,i);
		}
		public List<LiteralContext> literal() {
			return getRuleContexts(LiteralContext.class);
		}
		public LiteralContext literal(int i) {
			return getRuleContext(LiteralContext.class,i);
		}
		public List<FilenameContext> filename() {
			return getRuleContexts(FilenameContext.class);
		}
		public FilenameContext filename(int i) {
			return getRuleContext(FilenameContext.class,i);
		}
		public List<TerminalNode> TEXT() { return getTokens(CobolPreprocessorParser.TEXT); }
		public TerminalNode TEXT(int i) {
			return getToken(CobolPreprocessorParser.TEXT, i);
		}
		public List<TerminalNode> DOT() { return getTokens(CobolPreprocessorParser.DOT); }
		public TerminalNode DOT(int i) {
			return getToken(CobolPreprocessorParser.DOT, i);
		}
		public List<TerminalNode> LPARENCHAR() { return getTokens(CobolPreprocessorParser.LPARENCHAR); }
		public TerminalNode LPARENCHAR(int i) {
			return getToken(CobolPreprocessorParser.LPARENCHAR, i);
		}
		public List<TerminalNode> RPARENCHAR() { return getTokens(CobolPreprocessorParser.RPARENCHAR); }
		public TerminalNode RPARENCHAR(int i) {
			return getToken(CobolPreprocessorParser.RPARENCHAR, i);
		}
		public CharDataLineContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_charDataLine; }
	}

	public final CharDataLineContext charDataLine() throws RecognitionException {
		CharDataLineContext _localctx = new CharDataLineContext(_ctx, getState());
		enterRule(_localctx, 52, RULE_charDataLine);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(671); 
			_errHandler.sync(this);
			_alt = 1;
			do {
				switch (_alt) {
				case 1:
					{
					setState(671);
					_errHandler.sync(this);
					switch (_input.LA(1)) {
					case ADATA:
					case ADV:
					case ALIAS:
					case ANSI:
					case ANY:
					case APOST:
					case AR:
					case ARITH:
					case AUTO:
					case AWO:
					case BIN:
					case BLOCK0:
					case BUF:
					case BUFSIZE:
					case BY:
					case CBL:
					case CBLCARD:
					case CO:
					case COBOL2:
					case COBOL3:
					case CODEPAGE:
					case COMPAT:
					case COMPILE:
					case CP:
					case CPP:
					case CPSM:
					case CS:
					case CURR:
					case CURRENCY:
					case DATA:
					case DATEPROC:
					case DBCS:
					case DD:
					case DEBUG:
					case DECK:
					case DIAGTRUNC:
					case DLI:
					case DLL:
					case DP:
					case DTR:
					case DU:
					case DUMP:
					case DYN:
					case DYNAM:
					case EDF:
					case EJECT:
					case EJPD:
					case EN:
					case ENGLISH:
					case EPILOG:
					case EXCI:
					case EXIT:
					case EXP:
					case EXPORTALL:
					case EXTEND:
					case FASTSRT:
					case FLAG:
					case FLAGSTD:
					case FSRT:
					case FULL:
					case GDS:
					case GRAPHIC:
					case HOOK:
					case IN:
					case INTDATE:
					case JA:
					case JP:
					case KA:
					case LANG:
					case LANGUAGE:
					case LC:
					case LENGTH:
					case LIB:
					case LILIAN:
					case LIN:
					case LINECOUNT:
					case LINKAGE:
					case LIST:
					case LM:
					case LONGMIXED:
					case LONGUPPER:
					case LU:
					case MAP:
					case MARGINS:
					case MAX:
					case MD:
					case MDECK:
					case MIG:
					case MIXED:
					case NAME:
					case NAT:
					case NATIONAL:
					case NATLANG:
					case NN:
					case NO:
					case NOADATA:
					case NOADV:
					case NOALIAS:
					case NOAWO:
					case NOBLOCK0:
					case NOC:
					case NOCBLCARD:
					case NOCICS:
					case NOCMPR2:
					case NOCOMPILE:
					case NOCPSM:
					case NOCURR:
					case NOCURRENCY:
					case NOD:
					case NODATEPROC:
					case NODBCS:
					case NODE:
					case NODEBUG:
					case NODECK:
					case NODIAGTRUNC:
					case NODLL:
					case NODU:
					case NODUMP:
					case NODP:
					case NODTR:
					case NODYN:
					case NODYNAM:
					case NOEDF:
					case NOEJPD:
					case NOEPILOG:
					case NOEXIT:
					case NOEXP:
					case NOEXPORTALL:
					case NOF:
					case NOFASTSRT:
					case NOFEPI:
					case NOFLAG:
					case NOFLAGMIG:
					case NOFLAGSTD:
					case NOFSRT:
					case NOGRAPHIC:
					case NOHOOK:
					case NOLENGTH:
					case NOLIB:
					case NOLINKAGE:
					case NOLIST:
					case NOMAP:
					case NOMD:
					case NOMDECK:
					case NONAME:
					case NONUM:
					case NONUMBER:
					case NOOBJ:
					case NOOBJECT:
					case NOOFF:
					case NOOFFSET:
					case NOOPSEQUENCE:
					case NOOPT:
					case NOOPTIMIZE:
					case NOOPTIONS:
					case NOP:
					case NOPFD:
					case NOPROLOG:
					case NORENT:
					case NOS:
					case NOSEP:
					case NOSEPARATE:
					case NOSEQ:
					case NOSOURCE:
					case NOSPIE:
					case NOSQL:
					case NOSQLC:
					case NOSQLCCSID:
					case NOSSR:
					case NOSSRANGE:
					case NOSTDTRUNC:
					case NOSEQUENCE:
					case NOTERM:
					case NOTERMINAL:
					case NOTEST:
					case NOTHREAD:
					case NOTRIG:
					case NOVBREF:
					case NOWORD:
					case NOX:
					case NOXREF:
					case NOZWB:
					case NS:
					case NSEQ:
					case NSYMBOL:
					case NUM:
					case NUMBER:
					case NUMPROC:
					case OBJ:
					case OBJECT:
					case OF:
					case OFF:
					case OFFSET:
					case ON:
					case OP:
					case OPMARGINS:
					case OPSEQUENCE:
					case OPT:
					case OPTFILE:
					case OPTIMIZE:
					case OPTIONS:
					case OUT:
					case OUTDD:
					case PFD:
					case PPTDBG:
					case PGMN:
					case PGMNAME:
					case PROCESS:
					case PROLOG:
					case QUOTE:
					case RENT:
					case REPLACING:
					case RMODE:
					case SEP:
					case SEPARATE:
					case SEQ:
					case SEQUENCE:
					case SHORT:
					case SIZE:
					case SOURCE:
					case SP:
					case SPACE:
					case SPIE:
					case SQL:
					case SQLC:
					case SQLCCSID:
					case SS:
					case SSR:
					case SSRANGE:
					case STD:
					case SYSEIB:
					case SZ:
					case TERM:
					case TERMINAL:
					case TEST:
					case THREAD:
					case TITLE:
					case TRIG:
					case TRUNC:
					case UE:
					case UPPER:
					case VBREF:
					case WD:
					case XMLPARSE:
					case XMLSS:
					case XOPTS:
					case XREF:
					case YEARWINDOW:
					case YW:
					case ZWB:
					case C_CHAR:
					case D_CHAR:
					case E_CHAR:
					case F_CHAR:
					case H_CHAR:
					case I_CHAR:
					case M_CHAR:
					case N_CHAR:
					case Q_CHAR:
					case S_CHAR:
					case U_CHAR:
					case W_CHAR:
					case X_CHAR:
					case COMMACHAR:
					case IDENTIFIER:
						{
						setState(664);
						cobolWord();
						}
						break;
					case NONNUMERICLITERAL:
					case NUMERICLITERAL:
						{
						setState(665);
						literal();
						}
						break;
					case FILENAME:
						{
						setState(666);
						filename();
						}
						break;
					case TEXT:
						{
						setState(667);
						match(TEXT);
						}
						break;
					case DOT:
						{
						setState(668);
						match(DOT);
						}
						break;
					case LPARENCHAR:
						{
						setState(669);
						match(LPARENCHAR);
						}
						break;
					case RPARENCHAR:
						{
						setState(670);
						match(RPARENCHAR);
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				setState(673); 
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,73,_ctx);
			} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CobolWordContext extends ParserRuleContext {
		public TerminalNode IDENTIFIER() { return getToken(CobolPreprocessorParser.IDENTIFIER, 0); }
		public CharDataKeywordContext charDataKeyword() {
			return getRuleContext(CharDataKeywordContext.class,0);
		}
		public CobolWordContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_cobolWord; }
	}

	public final CobolWordContext cobolWord() throws RecognitionException {
		CobolWordContext _localctx = new CobolWordContext(_ctx, getState());
		enterRule(_localctx, 54, RULE_cobolWord);
		try {
			setState(677);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case IDENTIFIER:
				enterOuterAlt(_localctx, 1);
				{
				setState(675);
				match(IDENTIFIER);
				}
				break;
			case ADATA:
			case ADV:
			case ALIAS:
			case ANSI:
			case ANY:
			case APOST:
			case AR:
			case ARITH:
			case AUTO:
			case AWO:
			case BIN:
			case BLOCK0:
			case BUF:
			case BUFSIZE:
			case BY:
			case CBL:
			case CBLCARD:
			case CO:
			case COBOL2:
			case COBOL3:
			case CODEPAGE:
			case COMPAT:
			case COMPILE:
			case CP:
			case CPP:
			case CPSM:
			case CS:
			case CURR:
			case CURRENCY:
			case DATA:
			case DATEPROC:
			case DBCS:
			case DD:
			case DEBUG:
			case DECK:
			case DIAGTRUNC:
			case DLI:
			case DLL:
			case DP:
			case DTR:
			case DU:
			case DUMP:
			case DYN:
			case DYNAM:
			case EDF:
			case EJECT:
			case EJPD:
			case EN:
			case ENGLISH:
			case EPILOG:
			case EXCI:
			case EXIT:
			case EXP:
			case EXPORTALL:
			case EXTEND:
			case FASTSRT:
			case FLAG:
			case FLAGSTD:
			case FSRT:
			case FULL:
			case GDS:
			case GRAPHIC:
			case HOOK:
			case IN:
			case INTDATE:
			case JA:
			case JP:
			case KA:
			case LANG:
			case LANGUAGE:
			case LC:
			case LENGTH:
			case LIB:
			case LILIAN:
			case LIN:
			case LINECOUNT:
			case LINKAGE:
			case LIST:
			case LM:
			case LONGMIXED:
			case LONGUPPER:
			case LU:
			case MAP:
			case MARGINS:
			case MAX:
			case MD:
			case MDECK:
			case MIG:
			case MIXED:
			case NAME:
			case NAT:
			case NATIONAL:
			case NATLANG:
			case NN:
			case NO:
			case NOADATA:
			case NOADV:
			case NOALIAS:
			case NOAWO:
			case NOBLOCK0:
			case NOC:
			case NOCBLCARD:
			case NOCICS:
			case NOCMPR2:
			case NOCOMPILE:
			case NOCPSM:
			case NOCURR:
			case NOCURRENCY:
			case NOD:
			case NODATEPROC:
			case NODBCS:
			case NODE:
			case NODEBUG:
			case NODECK:
			case NODIAGTRUNC:
			case NODLL:
			case NODU:
			case NODUMP:
			case NODP:
			case NODTR:
			case NODYN:
			case NODYNAM:
			case NOEDF:
			case NOEJPD:
			case NOEPILOG:
			case NOEXIT:
			case NOEXP:
			case NOEXPORTALL:
			case NOF:
			case NOFASTSRT:
			case NOFEPI:
			case NOFLAG:
			case NOFLAGMIG:
			case NOFLAGSTD:
			case NOFSRT:
			case NOGRAPHIC:
			case NOHOOK:
			case NOLENGTH:
			case NOLIB:
			case NOLINKAGE:
			case NOLIST:
			case NOMAP:
			case NOMD:
			case NOMDECK:
			case NONAME:
			case NONUM:
			case NONUMBER:
			case NOOBJ:
			case NOOBJECT:
			case NOOFF:
			case NOOFFSET:
			case NOOPSEQUENCE:
			case NOOPT:
			case NOOPTIMIZE:
			case NOOPTIONS:
			case NOP:
			case NOPFD:
			case NOPROLOG:
			case NORENT:
			case NOS:
			case NOSEP:
			case NOSEPARATE:
			case NOSEQ:
			case NOSOURCE:
			case NOSPIE:
			case NOSQL:
			case NOSQLC:
			case NOSQLCCSID:
			case NOSSR:
			case NOSSRANGE:
			case NOSTDTRUNC:
			case NOSEQUENCE:
			case NOTERM:
			case NOTERMINAL:
			case NOTEST:
			case NOTHREAD:
			case NOTRIG:
			case NOVBREF:
			case NOWORD:
			case NOX:
			case NOXREF:
			case NOZWB:
			case NS:
			case NSEQ:
			case NSYMBOL:
			case NUM:
			case NUMBER:
			case NUMPROC:
			case OBJ:
			case OBJECT:
			case OF:
			case OFF:
			case OFFSET:
			case ON:
			case OP:
			case OPMARGINS:
			case OPSEQUENCE:
			case OPT:
			case OPTFILE:
			case OPTIMIZE:
			case OPTIONS:
			case OUT:
			case OUTDD:
			case PFD:
			case PPTDBG:
			case PGMN:
			case PGMNAME:
			case PROCESS:
			case PROLOG:
			case QUOTE:
			case RENT:
			case REPLACING:
			case RMODE:
			case SEP:
			case SEPARATE:
			case SEQ:
			case SEQUENCE:
			case SHORT:
			case SIZE:
			case SOURCE:
			case SP:
			case SPACE:
			case SPIE:
			case SQL:
			case SQLC:
			case SQLCCSID:
			case SS:
			case SSR:
			case SSRANGE:
			case STD:
			case SYSEIB:
			case SZ:
			case TERM:
			case TERMINAL:
			case TEST:
			case THREAD:
			case TITLE:
			case TRIG:
			case TRUNC:
			case UE:
			case UPPER:
			case VBREF:
			case WD:
			case XMLPARSE:
			case XMLSS:
			case XOPTS:
			case XREF:
			case YEARWINDOW:
			case YW:
			case ZWB:
			case C_CHAR:
			case D_CHAR:
			case E_CHAR:
			case F_CHAR:
			case H_CHAR:
			case I_CHAR:
			case M_CHAR:
			case N_CHAR:
			case Q_CHAR:
			case S_CHAR:
			case U_CHAR:
			case W_CHAR:
			case X_CHAR:
			case COMMACHAR:
				enterOuterAlt(_localctx, 2);
				{
				setState(676);
				charDataKeyword();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LiteralContext extends ParserRuleContext {
		public TerminalNode NONNUMERICLITERAL() { return getToken(CobolPreprocessorParser.NONNUMERICLITERAL, 0); }
		public TerminalNode NUMERICLITERAL() { return getToken(CobolPreprocessorParser.NUMERICLITERAL, 0); }
		public LiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_literal; }
	}

	public final LiteralContext literal() throws RecognitionException {
		LiteralContext _localctx = new LiteralContext(_ctx, getState());
		enterRule(_localctx, 56, RULE_literal);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(679);
			_la = _input.LA(1);
			if ( !(_la==NONNUMERICLITERAL || _la==NUMERICLITERAL) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FilenameContext extends ParserRuleContext {
		public TerminalNode FILENAME() { return getToken(CobolPreprocessorParser.FILENAME, 0); }
		public FilenameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_filename; }
	}

	public final FilenameContext filename() throws RecognitionException {
		FilenameContext _localctx = new FilenameContext(_ctx, getState());
		enterRule(_localctx, 58, RULE_filename);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(681);
			match(FILENAME);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CharDataKeywordContext extends ParserRuleContext {
		public TerminalNode ADATA() { return getToken(CobolPreprocessorParser.ADATA, 0); }
		public TerminalNode ADV() { return getToken(CobolPreprocessorParser.ADV, 0); }
		public TerminalNode ALIAS() { return getToken(CobolPreprocessorParser.ALIAS, 0); }
		public TerminalNode ANSI() { return getToken(CobolPreprocessorParser.ANSI, 0); }
		public TerminalNode ANY() { return getToken(CobolPreprocessorParser.ANY, 0); }
		public TerminalNode APOST() { return getToken(CobolPreprocessorParser.APOST, 0); }
		public TerminalNode AR() { return getToken(CobolPreprocessorParser.AR, 0); }
		public TerminalNode ARITH() { return getToken(CobolPreprocessorParser.ARITH, 0); }
		public TerminalNode AUTO() { return getToken(CobolPreprocessorParser.AUTO, 0); }
		public TerminalNode AWO() { return getToken(CobolPreprocessorParser.AWO, 0); }
		public TerminalNode BIN() { return getToken(CobolPreprocessorParser.BIN, 0); }
		public TerminalNode BLOCK0() { return getToken(CobolPreprocessorParser.BLOCK0, 0); }
		public TerminalNode BUF() { return getToken(CobolPreprocessorParser.BUF, 0); }
		public TerminalNode BUFSIZE() { return getToken(CobolPreprocessorParser.BUFSIZE, 0); }
		public TerminalNode BY() { return getToken(CobolPreprocessorParser.BY, 0); }
		public TerminalNode CBL() { return getToken(CobolPreprocessorParser.CBL, 0); }
		public TerminalNode CBLCARD() { return getToken(CobolPreprocessorParser.CBLCARD, 0); }
		public TerminalNode CO() { return getToken(CobolPreprocessorParser.CO, 0); }
		public TerminalNode COBOL2() { return getToken(CobolPreprocessorParser.COBOL2, 0); }
		public TerminalNode COBOL3() { return getToken(CobolPreprocessorParser.COBOL3, 0); }
		public TerminalNode CODEPAGE() { return getToken(CobolPreprocessorParser.CODEPAGE, 0); }
		public TerminalNode COMMACHAR() { return getToken(CobolPreprocessorParser.COMMACHAR, 0); }
		public TerminalNode COMPAT() { return getToken(CobolPreprocessorParser.COMPAT, 0); }
		public TerminalNode COMPILE() { return getToken(CobolPreprocessorParser.COMPILE, 0); }
		public TerminalNode CP() { return getToken(CobolPreprocessorParser.CP, 0); }
		public TerminalNode CPP() { return getToken(CobolPreprocessorParser.CPP, 0); }
		public TerminalNode CPSM() { return getToken(CobolPreprocessorParser.CPSM, 0); }
		public TerminalNode CS() { return getToken(CobolPreprocessorParser.CS, 0); }
		public TerminalNode CURR() { return getToken(CobolPreprocessorParser.CURR, 0); }
		public TerminalNode CURRENCY() { return getToken(CobolPreprocessorParser.CURRENCY, 0); }
		public TerminalNode DATA() { return getToken(CobolPreprocessorParser.DATA, 0); }
		public TerminalNode DATEPROC() { return getToken(CobolPreprocessorParser.DATEPROC, 0); }
		public TerminalNode DBCS() { return getToken(CobolPreprocessorParser.DBCS, 0); }
		public TerminalNode DD() { return getToken(CobolPreprocessorParser.DD, 0); }
		public TerminalNode DEBUG() { return getToken(CobolPreprocessorParser.DEBUG, 0); }
		public TerminalNode DECK() { return getToken(CobolPreprocessorParser.DECK, 0); }
		public TerminalNode DIAGTRUNC() { return getToken(CobolPreprocessorParser.DIAGTRUNC, 0); }
		public TerminalNode DLI() { return getToken(CobolPreprocessorParser.DLI, 0); }
		public TerminalNode DLL() { return getToken(CobolPreprocessorParser.DLL, 0); }
		public TerminalNode DP() { return getToken(CobolPreprocessorParser.DP, 0); }
		public TerminalNode DTR() { return getToken(CobolPreprocessorParser.DTR, 0); }
		public TerminalNode DU() { return getToken(CobolPreprocessorParser.DU, 0); }
		public TerminalNode DUMP() { return getToken(CobolPreprocessorParser.DUMP, 0); }
		public TerminalNode DYN() { return getToken(CobolPreprocessorParser.DYN, 0); }
		public TerminalNode DYNAM() { return getToken(CobolPreprocessorParser.DYNAM, 0); }
		public TerminalNode EDF() { return getToken(CobolPreprocessorParser.EDF, 0); }
		public TerminalNode EJECT() { return getToken(CobolPreprocessorParser.EJECT, 0); }
		public TerminalNode EJPD() { return getToken(CobolPreprocessorParser.EJPD, 0); }
		public TerminalNode EN() { return getToken(CobolPreprocessorParser.EN, 0); }
		public TerminalNode ENGLISH() { return getToken(CobolPreprocessorParser.ENGLISH, 0); }
		public TerminalNode EPILOG() { return getToken(CobolPreprocessorParser.EPILOG, 0); }
		public TerminalNode EXCI() { return getToken(CobolPreprocessorParser.EXCI, 0); }
		public TerminalNode EXIT() { return getToken(CobolPreprocessorParser.EXIT, 0); }
		public TerminalNode EXP() { return getToken(CobolPreprocessorParser.EXP, 0); }
		public TerminalNode EXPORTALL() { return getToken(CobolPreprocessorParser.EXPORTALL, 0); }
		public TerminalNode EXTEND() { return getToken(CobolPreprocessorParser.EXTEND, 0); }
		public TerminalNode FASTSRT() { return getToken(CobolPreprocessorParser.FASTSRT, 0); }
		public TerminalNode FLAG() { return getToken(CobolPreprocessorParser.FLAG, 0); }
		public TerminalNode FLAGSTD() { return getToken(CobolPreprocessorParser.FLAGSTD, 0); }
		public TerminalNode FULL() { return getToken(CobolPreprocessorParser.FULL, 0); }
		public TerminalNode FSRT() { return getToken(CobolPreprocessorParser.FSRT, 0); }
		public TerminalNode GDS() { return getToken(CobolPreprocessorParser.GDS, 0); }
		public TerminalNode GRAPHIC() { return getToken(CobolPreprocessorParser.GRAPHIC, 0); }
		public TerminalNode HOOK() { return getToken(CobolPreprocessorParser.HOOK, 0); }
		public TerminalNode IN() { return getToken(CobolPreprocessorParser.IN, 0); }
		public TerminalNode INTDATE() { return getToken(CobolPreprocessorParser.INTDATE, 0); }
		public TerminalNode JA() { return getToken(CobolPreprocessorParser.JA, 0); }
		public TerminalNode JP() { return getToken(CobolPreprocessorParser.JP, 0); }
		public TerminalNode KA() { return getToken(CobolPreprocessorParser.KA, 0); }
		public TerminalNode LANG() { return getToken(CobolPreprocessorParser.LANG, 0); }
		public TerminalNode LANGUAGE() { return getToken(CobolPreprocessorParser.LANGUAGE, 0); }
		public TerminalNode LC() { return getToken(CobolPreprocessorParser.LC, 0); }
		public TerminalNode LENGTH() { return getToken(CobolPreprocessorParser.LENGTH, 0); }
		public TerminalNode LIB() { return getToken(CobolPreprocessorParser.LIB, 0); }
		public TerminalNode LILIAN() { return getToken(CobolPreprocessorParser.LILIAN, 0); }
		public TerminalNode LIN() { return getToken(CobolPreprocessorParser.LIN, 0); }
		public TerminalNode LINECOUNT() { return getToken(CobolPreprocessorParser.LINECOUNT, 0); }
		public TerminalNode LINKAGE() { return getToken(CobolPreprocessorParser.LINKAGE, 0); }
		public TerminalNode LIST() { return getToken(CobolPreprocessorParser.LIST, 0); }
		public TerminalNode LM() { return getToken(CobolPreprocessorParser.LM, 0); }
		public TerminalNode LONGMIXED() { return getToken(CobolPreprocessorParser.LONGMIXED, 0); }
		public TerminalNode LONGUPPER() { return getToken(CobolPreprocessorParser.LONGUPPER, 0); }
		public TerminalNode LU() { return getToken(CobolPreprocessorParser.LU, 0); }
		public TerminalNode MAP() { return getToken(CobolPreprocessorParser.MAP, 0); }
		public TerminalNode MARGINS() { return getToken(CobolPreprocessorParser.MARGINS, 0); }
		public TerminalNode MAX() { return getToken(CobolPreprocessorParser.MAX, 0); }
		public TerminalNode MD() { return getToken(CobolPreprocessorParser.MD, 0); }
		public TerminalNode MDECK() { return getToken(CobolPreprocessorParser.MDECK, 0); }
		public TerminalNode MIG() { return getToken(CobolPreprocessorParser.MIG, 0); }
		public TerminalNode MIXED() { return getToken(CobolPreprocessorParser.MIXED, 0); }
		public TerminalNode NAME() { return getToken(CobolPreprocessorParser.NAME, 0); }
		public TerminalNode NAT() { return getToken(CobolPreprocessorParser.NAT, 0); }
		public TerminalNode NATIONAL() { return getToken(CobolPreprocessorParser.NATIONAL, 0); }
		public TerminalNode NATLANG() { return getToken(CobolPreprocessorParser.NATLANG, 0); }
		public TerminalNode NN() { return getToken(CobolPreprocessorParser.NN, 0); }
		public TerminalNode NO() { return getToken(CobolPreprocessorParser.NO, 0); }
		public TerminalNode NOADATA() { return getToken(CobolPreprocessorParser.NOADATA, 0); }
		public TerminalNode NOADV() { return getToken(CobolPreprocessorParser.NOADV, 0); }
		public TerminalNode NOALIAS() { return getToken(CobolPreprocessorParser.NOALIAS, 0); }
		public TerminalNode NOAWO() { return getToken(CobolPreprocessorParser.NOAWO, 0); }
		public TerminalNode NOBLOCK0() { return getToken(CobolPreprocessorParser.NOBLOCK0, 0); }
		public TerminalNode NOC() { return getToken(CobolPreprocessorParser.NOC, 0); }
		public TerminalNode NOCBLCARD() { return getToken(CobolPreprocessorParser.NOCBLCARD, 0); }
		public TerminalNode NOCICS() { return getToken(CobolPreprocessorParser.NOCICS, 0); }
		public TerminalNode NOCMPR2() { return getToken(CobolPreprocessorParser.NOCMPR2, 0); }
		public TerminalNode NOCOMPILE() { return getToken(CobolPreprocessorParser.NOCOMPILE, 0); }
		public TerminalNode NOCPSM() { return getToken(CobolPreprocessorParser.NOCPSM, 0); }
		public TerminalNode NOCURR() { return getToken(CobolPreprocessorParser.NOCURR, 0); }
		public TerminalNode NOCURRENCY() { return getToken(CobolPreprocessorParser.NOCURRENCY, 0); }
		public TerminalNode NOD() { return getToken(CobolPreprocessorParser.NOD, 0); }
		public TerminalNode NODATEPROC() { return getToken(CobolPreprocessorParser.NODATEPROC, 0); }
		public TerminalNode NODBCS() { return getToken(CobolPreprocessorParser.NODBCS, 0); }
		public TerminalNode NODE() { return getToken(CobolPreprocessorParser.NODE, 0); }
		public TerminalNode NODEBUG() { return getToken(CobolPreprocessorParser.NODEBUG, 0); }
		public TerminalNode NODECK() { return getToken(CobolPreprocessorParser.NODECK, 0); }
		public TerminalNode NODIAGTRUNC() { return getToken(CobolPreprocessorParser.NODIAGTRUNC, 0); }
		public TerminalNode NODLL() { return getToken(CobolPreprocessorParser.NODLL, 0); }
		public TerminalNode NODU() { return getToken(CobolPreprocessorParser.NODU, 0); }
		public TerminalNode NODUMP() { return getToken(CobolPreprocessorParser.NODUMP, 0); }
		public TerminalNode NODP() { return getToken(CobolPreprocessorParser.NODP, 0); }
		public TerminalNode NODTR() { return getToken(CobolPreprocessorParser.NODTR, 0); }
		public TerminalNode NODYN() { return getToken(CobolPreprocessorParser.NODYN, 0); }
		public TerminalNode NODYNAM() { return getToken(CobolPreprocessorParser.NODYNAM, 0); }
		public TerminalNode NOEDF() { return getToken(CobolPreprocessorParser.NOEDF, 0); }
		public TerminalNode NOEJPD() { return getToken(CobolPreprocessorParser.NOEJPD, 0); }
		public TerminalNode NOEPILOG() { return getToken(CobolPreprocessorParser.NOEPILOG, 0); }
		public TerminalNode NOEXIT() { return getToken(CobolPreprocessorParser.NOEXIT, 0); }
		public TerminalNode NOEXP() { return getToken(CobolPreprocessorParser.NOEXP, 0); }
		public TerminalNode NOEXPORTALL() { return getToken(CobolPreprocessorParser.NOEXPORTALL, 0); }
		public TerminalNode NOF() { return getToken(CobolPreprocessorParser.NOF, 0); }
		public TerminalNode NOFASTSRT() { return getToken(CobolPreprocessorParser.NOFASTSRT, 0); }
		public TerminalNode NOFEPI() { return getToken(CobolPreprocessorParser.NOFEPI, 0); }
		public TerminalNode NOFLAG() { return getToken(CobolPreprocessorParser.NOFLAG, 0); }
		public TerminalNode NOFLAGMIG() { return getToken(CobolPreprocessorParser.NOFLAGMIG, 0); }
		public TerminalNode NOFLAGSTD() { return getToken(CobolPreprocessorParser.NOFLAGSTD, 0); }
		public TerminalNode NOFSRT() { return getToken(CobolPreprocessorParser.NOFSRT, 0); }
		public TerminalNode NOGRAPHIC() { return getToken(CobolPreprocessorParser.NOGRAPHIC, 0); }
		public TerminalNode NOHOOK() { return getToken(CobolPreprocessorParser.NOHOOK, 0); }
		public TerminalNode NOLENGTH() { return getToken(CobolPreprocessorParser.NOLENGTH, 0); }
		public TerminalNode NOLIB() { return getToken(CobolPreprocessorParser.NOLIB, 0); }
		public TerminalNode NOLINKAGE() { return getToken(CobolPreprocessorParser.NOLINKAGE, 0); }
		public TerminalNode NOLIST() { return getToken(CobolPreprocessorParser.NOLIST, 0); }
		public TerminalNode NOMAP() { return getToken(CobolPreprocessorParser.NOMAP, 0); }
		public TerminalNode NOMD() { return getToken(CobolPreprocessorParser.NOMD, 0); }
		public TerminalNode NOMDECK() { return getToken(CobolPreprocessorParser.NOMDECK, 0); }
		public TerminalNode NONAME() { return getToken(CobolPreprocessorParser.NONAME, 0); }
		public TerminalNode NONUM() { return getToken(CobolPreprocessorParser.NONUM, 0); }
		public TerminalNode NONUMBER() { return getToken(CobolPreprocessorParser.NONUMBER, 0); }
		public TerminalNode NOOBJ() { return getToken(CobolPreprocessorParser.NOOBJ, 0); }
		public TerminalNode NOOBJECT() { return getToken(CobolPreprocessorParser.NOOBJECT, 0); }
		public TerminalNode NOOFF() { return getToken(CobolPreprocessorParser.NOOFF, 0); }
		public TerminalNode NOOFFSET() { return getToken(CobolPreprocessorParser.NOOFFSET, 0); }
		public TerminalNode NOOPSEQUENCE() { return getToken(CobolPreprocessorParser.NOOPSEQUENCE, 0); }
		public TerminalNode NOOPT() { return getToken(CobolPreprocessorParser.NOOPT, 0); }
		public TerminalNode NOOPTIMIZE() { return getToken(CobolPreprocessorParser.NOOPTIMIZE, 0); }
		public TerminalNode NOOPTIONS() { return getToken(CobolPreprocessorParser.NOOPTIONS, 0); }
		public TerminalNode NOP() { return getToken(CobolPreprocessorParser.NOP, 0); }
		public TerminalNode NOPFD() { return getToken(CobolPreprocessorParser.NOPFD, 0); }
		public TerminalNode NOPROLOG() { return getToken(CobolPreprocessorParser.NOPROLOG, 0); }
		public TerminalNode NORENT() { return getToken(CobolPreprocessorParser.NORENT, 0); }
		public TerminalNode NOS() { return getToken(CobolPreprocessorParser.NOS, 0); }
		public TerminalNode NOSEP() { return getToken(CobolPreprocessorParser.NOSEP, 0); }
		public TerminalNode NOSEPARATE() { return getToken(CobolPreprocessorParser.NOSEPARATE, 0); }
		public TerminalNode NOSEQ() { return getToken(CobolPreprocessorParser.NOSEQ, 0); }
		public TerminalNode NOSEQUENCE() { return getToken(CobolPreprocessorParser.NOSEQUENCE, 0); }
		public TerminalNode NOSOURCE() { return getToken(CobolPreprocessorParser.NOSOURCE, 0); }
		public TerminalNode NOSPIE() { return getToken(CobolPreprocessorParser.NOSPIE, 0); }
		public TerminalNode NOSQL() { return getToken(CobolPreprocessorParser.NOSQL, 0); }
		public TerminalNode NOSQLC() { return getToken(CobolPreprocessorParser.NOSQLC, 0); }
		public TerminalNode NOSQLCCSID() { return getToken(CobolPreprocessorParser.NOSQLCCSID, 0); }
		public TerminalNode NOSSR() { return getToken(CobolPreprocessorParser.NOSSR, 0); }
		public TerminalNode NOSSRANGE() { return getToken(CobolPreprocessorParser.NOSSRANGE, 0); }
		public TerminalNode NOSTDTRUNC() { return getToken(CobolPreprocessorParser.NOSTDTRUNC, 0); }
		public TerminalNode NOTERM() { return getToken(CobolPreprocessorParser.NOTERM, 0); }
		public TerminalNode NOTERMINAL() { return getToken(CobolPreprocessorParser.NOTERMINAL, 0); }
		public TerminalNode NOTEST() { return getToken(CobolPreprocessorParser.NOTEST, 0); }
		public TerminalNode NOTHREAD() { return getToken(CobolPreprocessorParser.NOTHREAD, 0); }
		public TerminalNode NOTRIG() { return getToken(CobolPreprocessorParser.NOTRIG, 0); }
		public TerminalNode NOVBREF() { return getToken(CobolPreprocessorParser.NOVBREF, 0); }
		public TerminalNode NOWORD() { return getToken(CobolPreprocessorParser.NOWORD, 0); }
		public TerminalNode NOX() { return getToken(CobolPreprocessorParser.NOX, 0); }
		public TerminalNode NOXREF() { return getToken(CobolPreprocessorParser.NOXREF, 0); }
		public TerminalNode NOZWB() { return getToken(CobolPreprocessorParser.NOZWB, 0); }
		public TerminalNode NSEQ() { return getToken(CobolPreprocessorParser.NSEQ, 0); }
		public TerminalNode NSYMBOL() { return getToken(CobolPreprocessorParser.NSYMBOL, 0); }
		public TerminalNode NS() { return getToken(CobolPreprocessorParser.NS, 0); }
		public TerminalNode NUM() { return getToken(CobolPreprocessorParser.NUM, 0); }
		public TerminalNode NUMBER() { return getToken(CobolPreprocessorParser.NUMBER, 0); }
		public TerminalNode NUMPROC() { return getToken(CobolPreprocessorParser.NUMPROC, 0); }
		public TerminalNode OBJ() { return getToken(CobolPreprocessorParser.OBJ, 0); }
		public TerminalNode OBJECT() { return getToken(CobolPreprocessorParser.OBJECT, 0); }
		public TerminalNode ON() { return getToken(CobolPreprocessorParser.ON, 0); }
		public TerminalNode OF() { return getToken(CobolPreprocessorParser.OF, 0); }
		public TerminalNode OFF() { return getToken(CobolPreprocessorParser.OFF, 0); }
		public TerminalNode OFFSET() { return getToken(CobolPreprocessorParser.OFFSET, 0); }
		public TerminalNode OPMARGINS() { return getToken(CobolPreprocessorParser.OPMARGINS, 0); }
		public TerminalNode OPSEQUENCE() { return getToken(CobolPreprocessorParser.OPSEQUENCE, 0); }
		public TerminalNode OPTIMIZE() { return getToken(CobolPreprocessorParser.OPTIMIZE, 0); }
		public TerminalNode OP() { return getToken(CobolPreprocessorParser.OP, 0); }
		public TerminalNode OPT() { return getToken(CobolPreprocessorParser.OPT, 0); }
		public TerminalNode OPTFILE() { return getToken(CobolPreprocessorParser.OPTFILE, 0); }
		public TerminalNode OPTIONS() { return getToken(CobolPreprocessorParser.OPTIONS, 0); }
		public TerminalNode OUT() { return getToken(CobolPreprocessorParser.OUT, 0); }
		public TerminalNode OUTDD() { return getToken(CobolPreprocessorParser.OUTDD, 0); }
		public TerminalNode PFD() { return getToken(CobolPreprocessorParser.PFD, 0); }
		public TerminalNode PGMN() { return getToken(CobolPreprocessorParser.PGMN, 0); }
		public TerminalNode PGMNAME() { return getToken(CobolPreprocessorParser.PGMNAME, 0); }
		public TerminalNode PPTDBG() { return getToken(CobolPreprocessorParser.PPTDBG, 0); }
		public TerminalNode PROCESS() { return getToken(CobolPreprocessorParser.PROCESS, 0); }
		public TerminalNode PROLOG() { return getToken(CobolPreprocessorParser.PROLOG, 0); }
		public TerminalNode QUOTE() { return getToken(CobolPreprocessorParser.QUOTE, 0); }
		public TerminalNode RENT() { return getToken(CobolPreprocessorParser.RENT, 0); }
		public TerminalNode REPLACING() { return getToken(CobolPreprocessorParser.REPLACING, 0); }
		public TerminalNode RMODE() { return getToken(CobolPreprocessorParser.RMODE, 0); }
		public TerminalNode SEQ() { return getToken(CobolPreprocessorParser.SEQ, 0); }
		public TerminalNode SEQUENCE() { return getToken(CobolPreprocessorParser.SEQUENCE, 0); }
		public TerminalNode SEP() { return getToken(CobolPreprocessorParser.SEP, 0); }
		public TerminalNode SEPARATE() { return getToken(CobolPreprocessorParser.SEPARATE, 0); }
		public TerminalNode SHORT() { return getToken(CobolPreprocessorParser.SHORT, 0); }
		public TerminalNode SIZE() { return getToken(CobolPreprocessorParser.SIZE, 0); }
		public TerminalNode SOURCE() { return getToken(CobolPreprocessorParser.SOURCE, 0); }
		public TerminalNode SP() { return getToken(CobolPreprocessorParser.SP, 0); }
		public TerminalNode SPACE() { return getToken(CobolPreprocessorParser.SPACE, 0); }
		public TerminalNode SPIE() { return getToken(CobolPreprocessorParser.SPIE, 0); }
		public TerminalNode SQL() { return getToken(CobolPreprocessorParser.SQL, 0); }
		public TerminalNode SQLC() { return getToken(CobolPreprocessorParser.SQLC, 0); }
		public TerminalNode SQLCCSID() { return getToken(CobolPreprocessorParser.SQLCCSID, 0); }
		public TerminalNode SS() { return getToken(CobolPreprocessorParser.SS, 0); }
		public TerminalNode SSR() { return getToken(CobolPreprocessorParser.SSR, 0); }
		public TerminalNode SSRANGE() { return getToken(CobolPreprocessorParser.SSRANGE, 0); }
		public TerminalNode STD() { return getToken(CobolPreprocessorParser.STD, 0); }
		public TerminalNode SYSEIB() { return getToken(CobolPreprocessorParser.SYSEIB, 0); }
		public TerminalNode SZ() { return getToken(CobolPreprocessorParser.SZ, 0); }
		public TerminalNode TERM() { return getToken(CobolPreprocessorParser.TERM, 0); }
		public TerminalNode TERMINAL() { return getToken(CobolPreprocessorParser.TERMINAL, 0); }
		public TerminalNode TEST() { return getToken(CobolPreprocessorParser.TEST, 0); }
		public TerminalNode THREAD() { return getToken(CobolPreprocessorParser.THREAD, 0); }
		public TerminalNode TITLE() { return getToken(CobolPreprocessorParser.TITLE, 0); }
		public TerminalNode TRIG() { return getToken(CobolPreprocessorParser.TRIG, 0); }
		public TerminalNode TRUNC() { return getToken(CobolPreprocessorParser.TRUNC, 0); }
		public TerminalNode UE() { return getToken(CobolPreprocessorParser.UE, 0); }
		public TerminalNode UPPER() { return getToken(CobolPreprocessorParser.UPPER, 0); }
		public TerminalNode VBREF() { return getToken(CobolPreprocessorParser.VBREF, 0); }
		public TerminalNode WD() { return getToken(CobolPreprocessorParser.WD, 0); }
		public TerminalNode XMLPARSE() { return getToken(CobolPreprocessorParser.XMLPARSE, 0); }
		public TerminalNode XMLSS() { return getToken(CobolPreprocessorParser.XMLSS, 0); }
		public TerminalNode XOPTS() { return getToken(CobolPreprocessorParser.XOPTS, 0); }
		public TerminalNode XREF() { return getToken(CobolPreprocessorParser.XREF, 0); }
		public TerminalNode YEARWINDOW() { return getToken(CobolPreprocessorParser.YEARWINDOW, 0); }
		public TerminalNode YW() { return getToken(CobolPreprocessorParser.YW, 0); }
		public TerminalNode ZWB() { return getToken(CobolPreprocessorParser.ZWB, 0); }
		public TerminalNode C_CHAR() { return getToken(CobolPreprocessorParser.C_CHAR, 0); }
		public TerminalNode D_CHAR() { return getToken(CobolPreprocessorParser.D_CHAR, 0); }
		public TerminalNode E_CHAR() { return getToken(CobolPreprocessorParser.E_CHAR, 0); }
		public TerminalNode F_CHAR() { return getToken(CobolPreprocessorParser.F_CHAR, 0); }
		public TerminalNode H_CHAR() { return getToken(CobolPreprocessorParser.H_CHAR, 0); }
		public TerminalNode I_CHAR() { return getToken(CobolPreprocessorParser.I_CHAR, 0); }
		public TerminalNode M_CHAR() { return getToken(CobolPreprocessorParser.M_CHAR, 0); }
		public TerminalNode N_CHAR() { return getToken(CobolPreprocessorParser.N_CHAR, 0); }
		public TerminalNode Q_CHAR() { return getToken(CobolPreprocessorParser.Q_CHAR, 0); }
		public TerminalNode S_CHAR() { return getToken(CobolPreprocessorParser.S_CHAR, 0); }
		public TerminalNode U_CHAR() { return getToken(CobolPreprocessorParser.U_CHAR, 0); }
		public TerminalNode W_CHAR() { return getToken(CobolPreprocessorParser.W_CHAR, 0); }
		public TerminalNode X_CHAR() { return getToken(CobolPreprocessorParser.X_CHAR, 0); }
		public CharDataKeywordContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_charDataKeyword; }
	}

	public final CharDataKeywordContext charDataKeyword() throws RecognitionException {
		CharDataKeywordContext _localctx = new CharDataKeywordContext(_ctx, getState());
		enterRule(_localctx, 60, RULE_charDataKeyword);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(683);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << ADATA) | (1L << ADV) | (1L << ALIAS) | (1L << ANSI) | (1L << ANY) | (1L << APOST) | (1L << AR) | (1L << ARITH) | (1L << AUTO) | (1L << AWO) | (1L << BIN) | (1L << BLOCK0) | (1L << BUF) | (1L << BUFSIZE) | (1L << BY) | (1L << CBL) | (1L << CBLCARD) | (1L << CO) | (1L << COBOL2) | (1L << COBOL3) | (1L << CODEPAGE) | (1L << COMPAT) | (1L << COMPILE) | (1L << CP) | (1L << CPP) | (1L << CPSM) | (1L << CS) | (1L << CURR) | (1L << CURRENCY) | (1L << DATA) | (1L << DATEPROC) | (1L << DBCS) | (1L << DD) | (1L << DEBUG) | (1L << DECK) | (1L << DIAGTRUNC) | (1L << DLI) | (1L << DLL) | (1L << DP) | (1L << DTR) | (1L << DU) | (1L << DUMP) | (1L << DYN) | (1L << DYNAM) | (1L << EDF) | (1L << EJECT) | (1L << EJPD) | (1L << EN) | (1L << ENGLISH) | (1L << EPILOG) | (1L << EXCI) | (1L << EXIT) | (1L << EXP) | (1L << EXPORTALL) | (1L << EXTEND) | (1L << FASTSRT) | (1L << FLAG) | (1L << FLAGSTD))) != 0) || ((((_la - 64)) & ~0x3f) == 0 && ((1L << (_la - 64)) & ((1L << (FSRT - 64)) | (1L << (FULL - 64)) | (1L << (GDS - 64)) | (1L << (GRAPHIC - 64)) | (1L << (HOOK - 64)) | (1L << (IN - 64)) | (1L << (INTDATE - 64)) | (1L << (JA - 64)) | (1L << (JP - 64)) | (1L << (KA - 64)) | (1L << (LANG - 64)) | (1L << (LANGUAGE - 64)) | (1L << (LC - 64)) | (1L << (LENGTH - 64)) | (1L << (LIB - 64)) | (1L << (LILIAN - 64)) | (1L << (LIN - 64)) | (1L << (LINECOUNT - 64)) | (1L << (LINKAGE - 64)) | (1L << (LIST - 64)) | (1L << (LM - 64)) | (1L << (LONGMIXED - 64)) | (1L << (LONGUPPER - 64)) | (1L << (LU - 64)) | (1L << (MAP - 64)) | (1L << (MARGINS - 64)) | (1L << (MAX - 64)) | (1L << (MD - 64)) | (1L << (MDECK - 64)) | (1L << (MIG - 64)) | (1L << (MIXED - 64)) | (1L << (NAME - 64)) | (1L << (NAT - 64)) | (1L << (NATIONAL - 64)) | (1L << (NATLANG - 64)) | (1L << (NN - 64)) | (1L << (NO - 64)) | (1L << (NOADATA - 64)) | (1L << (NOADV - 64)) | (1L << (NOALIAS - 64)) | (1L << (NOAWO - 64)) | (1L << (NOBLOCK0 - 64)) | (1L << (NOC - 64)) | (1L << (NOCBLCARD - 64)) | (1L << (NOCICS - 64)) | (1L << (NOCMPR2 - 64)) | (1L << (NOCOMPILE - 64)) | (1L << (NOCPSM - 64)) | (1L << (NOCURR - 64)) | (1L << (NOCURRENCY - 64)) | (1L << (NOD - 64)) | (1L << (NODATEPROC - 64)) | (1L << (NODBCS - 64)) | (1L << (NODE - 64)) | (1L << (NODEBUG - 64)) | (1L << (NODECK - 64)) | (1L << (NODIAGTRUNC - 64)) | (1L << (NODLL - 64)) | (1L << (NODU - 64)) | (1L << (NODUMP - 64)) | (1L << (NODP - 64)))) != 0) || ((((_la - 128)) & ~0x3f) == 0 && ((1L << (_la - 128)) & ((1L << (NODTR - 128)) | (1L << (NODYN - 128)) | (1L << (NODYNAM - 128)) | (1L << (NOEDF - 128)) | (1L << (NOEJPD - 128)) | (1L << (NOEPILOG - 128)) | (1L << (NOEXIT - 128)) | (1L << (NOEXP - 128)) | (1L << (NOEXPORTALL - 128)) | (1L << (NOF - 128)) | (1L << (NOFASTSRT - 128)) | (1L << (NOFEPI - 128)) | (1L << (NOFLAG - 128)) | (1L << (NOFLAGMIG - 128)) | (1L << (NOFLAGSTD - 128)) | (1L << (NOFSRT - 128)) | (1L << (NOGRAPHIC - 128)) | (1L << (NOHOOK - 128)) | (1L << (NOLENGTH - 128)) | (1L << (NOLIB - 128)) | (1L << (NOLINKAGE - 128)) | (1L << (NOLIST - 128)) | (1L << (NOMAP - 128)) | (1L << (NOMD - 128)) | (1L << (NOMDECK - 128)) | (1L << (NONAME - 128)) | (1L << (NONUM - 128)) | (1L << (NONUMBER - 128)) | (1L << (NOOBJ - 128)) | (1L << (NOOBJECT - 128)) | (1L << (NOOFF - 128)) | (1L << (NOOFFSET - 128)) | (1L << (NOOPSEQUENCE - 128)) | (1L << (NOOPT - 128)) | (1L << (NOOPTIMIZE - 128)) | (1L << (NOOPTIONS - 128)) | (1L << (NOP - 128)) | (1L << (NOPFD - 128)) | (1L << (NOPROLOG - 128)) | (1L << (NORENT - 128)) | (1L << (NOS - 128)) | (1L << (NOSEP - 128)) | (1L << (NOSEPARATE - 128)) | (1L << (NOSEQ - 128)) | (1L << (NOSOURCE - 128)) | (1L << (NOSPIE - 128)) | (1L << (NOSQL - 128)) | (1L << (NOSQLC - 128)) | (1L << (NOSQLCCSID - 128)) | (1L << (NOSSR - 128)) | (1L << (NOSSRANGE - 128)) | (1L << (NOSTDTRUNC - 128)) | (1L << (NOSEQUENCE - 128)) | (1L << (NOTERM - 128)) | (1L << (NOTERMINAL - 128)) | (1L << (NOTEST - 128)) | (1L << (NOTHREAD - 128)) | (1L << (NOTRIG - 128)) | (1L << (NOVBREF - 128)) | (1L << (NOWORD - 128)) | (1L << (NOX - 128)) | (1L << (NOXREF - 128)) | (1L << (NOZWB - 128)))) != 0) || ((((_la - 192)) & ~0x3f) == 0 && ((1L << (_la - 192)) & ((1L << (NS - 192)) | (1L << (NSEQ - 192)) | (1L << (NSYMBOL - 192)) | (1L << (NUM - 192)) | (1L << (NUMBER - 192)) | (1L << (NUMPROC - 192)) | (1L << (OBJ - 192)) | (1L << (OBJECT - 192)) | (1L << (OF - 192)) | (1L << (OFF - 192)) | (1L << (OFFSET - 192)) | (1L << (ON - 192)) | (1L << (OP - 192)) | (1L << (OPMARGINS - 192)) | (1L << (OPSEQUENCE - 192)) | (1L << (OPT - 192)) | (1L << (OPTFILE - 192)) | (1L << (OPTIMIZE - 192)) | (1L << (OPTIONS - 192)) | (1L << (OUT - 192)) | (1L << (OUTDD - 192)) | (1L << (PFD - 192)) | (1L << (PPTDBG - 192)) | (1L << (PGMN - 192)) | (1L << (PGMNAME - 192)) | (1L << (PROCESS - 192)) | (1L << (PROLOG - 192)) | (1L << (QUOTE - 192)) | (1L << (RENT - 192)) | (1L << (REPLACING - 192)) | (1L << (RMODE - 192)) | (1L << (SEP - 192)) | (1L << (SEPARATE - 192)) | (1L << (SEQ - 192)) | (1L << (SEQUENCE - 192)) | (1L << (SHORT - 192)) | (1L << (SIZE - 192)) | (1L << (SOURCE - 192)) | (1L << (SP - 192)) | (1L << (SPACE - 192)) | (1L << (SPIE - 192)) | (1L << (SQL - 192)) | (1L << (SQLC - 192)) | (1L << (SQLCCSID - 192)) | (1L << (SS - 192)) | (1L << (SSR - 192)) | (1L << (SSRANGE - 192)) | (1L << (STD - 192)) | (1L << (SYSEIB - 192)) | (1L << (SZ - 192)) | (1L << (TERM - 192)) | (1L << (TERMINAL - 192)) | (1L << (TEST - 192)) | (1L << (THREAD - 192)) | (1L << (TITLE - 192)) | (1L << (TRIG - 192)) | (1L << (TRUNC - 192)))) != 0) || ((((_la - 256)) & ~0x3f) == 0 && ((1L << (_la - 256)) & ((1L << (UE - 256)) | (1L << (UPPER - 256)) | (1L << (VBREF - 256)) | (1L << (WD - 256)) | (1L << (XMLPARSE - 256)) | (1L << (XMLSS - 256)) | (1L << (XOPTS - 256)) | (1L << (XREF - 256)) | (1L << (YEARWINDOW - 256)) | (1L << (YW - 256)) | (1L << (ZWB - 256)) | (1L << (C_CHAR - 256)) | (1L << (D_CHAR - 256)) | (1L << (E_CHAR - 256)) | (1L << (F_CHAR - 256)) | (1L << (H_CHAR - 256)) | (1L << (I_CHAR - 256)) | (1L << (M_CHAR - 256)) | (1L << (N_CHAR - 256)) | (1L << (Q_CHAR - 256)) | (1L << (S_CHAR - 256)) | (1L << (U_CHAR - 256)) | (1L << (W_CHAR - 256)) | (1L << (X_CHAR - 256)) | (1L << (COMMACHAR - 256)))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\u0127\u02b0\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \3\2"+
		"\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\7\2M\n\2\f\2\16\2P\13\2\3"+
		"\2\3\2\3\3\3\3\5\3V\n\3\3\3\3\3\6\3Z\n\3\r\3\16\3[\3\4\3\4\3\4\3\4\5\4"+
		"b\n\4\3\4\7\4e\n\4\f\4\16\4h\13\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u0080\n\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\5\5\u0099\n\5\3\5\5\5\u009c\n\5\3\5\5\5\u009f\n\5\3"+
		"\5\5\5\u00a2\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\5\5\u00b6\n\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u00be\n\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u00de\n\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\5\5\u00e6\n\5\3\5\3\5\3\5\3\5\5\5\u00ec\n\5\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u00fd\n\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\5\5\u0146\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5"+
		"\u0155\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\5\5\u016b\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5"+
		"\u0175\n\5\3\5\3\5\3\5\3\5\5\5\u017b\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u018b\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5"+
		"\5\u0194\n\5\3\5\5\5\u0197\n\5\3\5\5\5\u019a\n\5\3\5\5\5\u019d\n\5\3\5"+
		"\5\5\u01a0\n\5\3\5\5\5\u01a3\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u01b7\n\5\3\5\5\5\u01ba\n\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\5\5\u01c2\n\5\3\6\3\6\3\6\3\6\3\6\5\6\u01c9\n\6\3"+
		"\7\3\7\3\7\3\7\5\7\u01cf\n\7\3\7\3\7\5\7\u01d3\n\7\3\b\3\b\3\b\3\b\3\b"+
		"\5\b\u01da\n\b\3\t\3\t\3\t\3\n\3\n\3\n\7\n\u01e2\n\n\f\n\16\n\u01e5\13"+
		"\n\3\n\3\n\3\n\3\n\5\n\u01eb\n\n\7\n\u01ed\n\n\f\n\16\n\u01f0\13\n\3\n"+
		"\7\n\u01f3\n\n\f\n\16\n\u01f6\13\n\3\n\3\n\3\13\3\13\3\13\5\13\u01fd\n"+
		"\13\3\13\3\13\5\13\u0201\n\13\3\f\3\f\5\f\u0205\n\f\3\r\3\r\7\r\u0209"+
		"\n\r\f\r\16\r\u020c\13\r\3\r\3\r\6\r\u0210\n\r\r\r\16\r\u0211\3\r\7\r"+
		"\u0215\n\r\f\r\16\r\u0218\13\r\3\16\3\16\3\16\7\16\u021d\n\16\f\16\16"+
		"\16\u0220\13\16\3\16\5\16\u0223\n\16\3\17\3\17\7\17\u0227\n\17\f\17\16"+
		"\17\u022a\13\17\3\17\6\17\u022d\n\17\r\17\16\17\u022e\3\17\3\17\3\20\3"+
		"\20\3\20\3\20\3\21\3\21\7\21\u0239\n\21\f\21\16\21\u023c\13\21\3\21\3"+
		"\21\7\21\u0240\n\21\f\21\16\21\u0243\13\21\3\21\3\21\7\21\u0247\n\21\f"+
		"\21\16\21\u024a\13\21\3\21\5\21\u024d\n\21\3\21\7\21\u0250\n\21\f\21\16"+
		"\21\u0253\13\21\3\21\5\21\u0256\n\21\3\22\3\22\7\22\u025a\n\22\f\22\16"+
		"\22\u025d\13\22\3\22\3\22\5\22\u0261\n\22\3\23\3\23\7\23\u0265\n\23\f"+
		"\23\16\23\u0268\13\23\3\23\3\23\5\23\u026c\n\23\3\24\3\24\3\24\3\24\5"+
		"\24\u0272\n\24\3\25\3\25\3\25\3\25\5\25\u0278\n\25\3\26\3\26\5\26\u027c"+
		"\n\26\3\27\3\27\5\27\u0280\n\27\3\30\3\30\3\30\5\30\u0285\n\30\3\31\3"+
		"\31\5\31\u0289\n\31\3\31\3\31\3\32\3\32\6\32\u028f\n\32\r\32\16\32\u0290"+
		"\3\33\3\33\3\33\3\33\6\33\u0297\n\33\r\33\16\33\u0298\3\34\3\34\3\34\3"+
		"\34\3\34\3\34\3\34\6\34\u02a2\n\34\r\34\16\34\u02a3\3\35\3\35\5\35\u02a8"+
		"\n\35\3\36\3\36\3\37\3\37\3 \3 \3 \2\2!\2\4\6\b\n\f\16\20\22\24\26\30"+
		"\32\34\36 \"$&(*,.\60\62\64\668:<>\2U\4\2\22\22\u00db\u00db\3\2\t\n\6"+
		"\2\31\31==\u010f\u010f\u0111\u0111\3\2\17\20\4\2\30\30\34\34\4\2\32\32"+
		"\u010f\u010f\3\2 !\4\2##++\4\2@@\u008e\u008e\4\2\u00bb\u00bb\u0100\u0100"+
		"\4\2\'\'\u0110\u0110\4\2((,,\3\2-.\3\2/\60\3\2;<\4\2>>BB\4\2@@\u0112\u0112"+
		"\5\2\u0111\u0111\u0114\u0114\u0118\u011a\3\2\u0113\u0115\b\2%%hh\u00f4"+
		"\u00f4\u0110\u0110\u0116\u0116\u0118\u0118\4\2\6\6SS\3\2MN\6\2\37\37\64"+
		"\65JL\u0102\u0102\4\2OOUU\3\2`a\6\2\32\32ooss\u010f\u010f\4\2\5\5ll\5"+
		"\2\37\37\64\64LL\4\2ooss\5\2\u0111\u0111\u0118\u0118\u011a\u011a\3\2u"+
		"v\4\2xx\u0081\u0081\4\2ww||\3\2\177\u0080\4\2}}\u0082\u0082\3\2\u0083"+
		"\u0084\3\2\u0089\u008a\4\2\u008c\u008c\u0091\u0091\4\2\u008b\u008b\u008e"+
		"\u008e\3\2\u0099\u009a\3\2\u009c\u009d\3\2\u009e\u009f\3\2\u00a0\u00a1"+
		"\3\2\u00a3\u00a4\4\2\u00ad\u00ad\u00b6\u00b6\4\2\u00aa\u00aa\u00ae\u00ae"+
		"\3\2\u00b1\u00b2\3\2\u00b3\u00b4\3\2\u00b7\u00b8\3\2\u00bd\u00be\4\2\u00c2"+
		"\u00c2\u00c4\u00c4\4\2$$ef\3\2\u00bf\u00c0\3\2\u00c5\u00c6\5\2bb\u00a7"+
		"\u00a7\u00d7\u00d7\3\2\u00c8\u00c9\3\2\u00cb\u00cc\4\2\u00d1\u00d1\u00d3"+
		"\u00d3\4\2CC\u00f7\u00f7\3\2\u00d5\u00d6\3\2\u00d9\u00da\n\2\25\25\31"+
		"\31XZ\\\\cc\u0103\u0103\u0115\u0115\u0119\u0119\4\2\u00dd\u00dd\u0117"+
		"\u0117\3\2\u00e5\u00e6\4\2\u00e8\u00e8\u00fa\u00fa\4\2\u00e9\u00e9\u0118"+
		"\u0118\3\2\u00ee\u00ef\3\2\u00f5\u00f6\3\2\u00fb\u00fc\4\2FF\u0093\u0093"+
		"\4\2\u00ab\u00ac\u00e3\u00e4\4\2\63\63\u0086\u0086\5\2\r\r\u00d1\u00d1"+
		"\u00f7\u00f7\3\2\u0105\u0106\4\2\u0107\u0107\u010a\u010a\6\2\31\31\u0108"+
		"\u0108\u010f\u010f\u011b\u011b\4\2\u010b\u010b\u011b\u011b\4\2CC\u00e7"+
		"\u00e7\3\2\u010c\u010d\4\2GG\u00ca\u00ca\3\2\u00f1\u00f3\3\2\u0120\u0121"+
		"\23\2\3\23\25\32\34\65\678:>@GIOQZ\\\u00bc\u00be\u00de\u00e0\u00e1\u00e3"+
		"\u00ef\u00f4\u00f7\u00f9\u0105\u0107\u0109\u010b\u011b\u011d\u011d\2\u0385"+
		"\2N\3\2\2\2\4S\3\2\2\2\6]\3\2\2\2\b\u01c1\3\2\2\2\n\u01c3\3\2\2\2\f\u01ca"+
		"\3\2\2\2\16\u01d4\3\2\2\2\20\u01db\3\2\2\2\22\u01de\3\2\2\2\24\u01fc\3"+
		"\2\2\2\26\u0204\3\2\2\2\30\u0206\3\2\2\2\32\u0219\3\2\2\2\34\u0224\3\2"+
		"\2\2\36\u0232\3\2\2\2 \u0236\3\2\2\2\"\u0257\3\2\2\2$\u0262\3\2\2\2&\u0271"+
		"\3\2\2\2(\u0277\3\2\2\2*\u0279\3\2\2\2,\u027d\3\2\2\2.\u0281\3\2\2\2\60"+
		"\u0286\3\2\2\2\62\u028e\3\2\2\2\64\u0296\3\2\2\2\66\u02a1\3\2\2\28\u02a7"+
		"\3\2\2\2:\u02a9\3\2\2\2<\u02ab\3\2\2\2>\u02ad\3\2\2\2@M\5\4\3\2AM\5\22"+
		"\n\2BM\5\n\6\2CM\5\f\7\2DM\5\16\b\2EM\5\36\20\2FM\5\32\16\2GM\5*\26\2"+
		"HM\5,\27\2IM\5.\30\2JM\5\66\34\2KM\7\u0124\2\2L@\3\2\2\2LA\3\2\2\2LB\3"+
		"\2\2\2LC\3\2\2\2LD\3\2\2\2LE\3\2\2\2LF\3\2\2\2LG\3\2\2\2LH\3\2\2\2LI\3"+
		"\2\2\2LJ\3\2\2\2LK\3\2\2\2MP\3\2\2\2NL\3\2\2\2NO\3\2\2\2OQ\3\2\2\2PN\3"+
		"\2\2\2QR\7\2\2\3R\3\3\2\2\2SY\t\2\2\2TV\7\u011d\2\2UT\3\2\2\2UV\3\2\2"+
		"\2VW\3\2\2\2WZ\5\b\5\2XZ\5\6\4\2YU\3\2\2\2YX\3\2\2\2Z[\3\2\2\2[Y\3\2\2"+
		"\2[\\\3\2\2\2\\\5\3\2\2\2]^\7\u0109\2\2^_\7[\2\2_f\5\b\5\2`b\7\u011d\2"+
		"\2a`\3\2\2\2ab\3\2\2\2bc\3\2\2\2ce\5\b\5\2da\3\2\2\2eh\3\2\2\2fd\3\2\2"+
		"\2fg\3\2\2\2gi\3\2\2\2hf\3\2\2\2ij\7\u00e2\2\2j\7\3\2\2\2k\u01c2\7\3\2"+
		"\2l\u01c2\7\4\2\2m\u01c2\7\b\2\2no\t\3\2\2op\7[\2\2pq\t\4\2\2q\u01c2\7"+
		"\u00e2\2\2r\u01c2\7\f\2\2s\u01c2\7\16\2\2tu\t\5\2\2uv\7[\2\2vw\5:\36\2"+
		"wx\7\u00e2\2\2x\u01c2\3\2\2\2y\u01c2\7\23\2\2z\177\7\24\2\2{|\7[\2\2|"+
		"}\5:\36\2}~\7\u00e2\2\2~\u0080\3\2\2\2\177{\3\2\2\2\177\u0080\3\2\2\2"+
		"\u0080\u01c2\3\2\2\2\u0081\u01c2\7\26\2\2\u0082\u01c2\7\27\2\2\u0083\u0084"+
		"\t\6\2\2\u0084\u0085\7[\2\2\u0085\u0086\5:\36\2\u0086\u0087\7\u00e2\2"+
		"\2\u0087\u01c2\3\2\2\2\u0088\u01c2\t\7\2\2\u0089\u01c2\7\35\2\2\u008a"+
		"\u01c2\7\36\2\2\u008b\u008c\t\b\2\2\u008c\u008d\7[\2\2\u008d\u008e\5:"+
		"\36\2\u008e\u008f\7\u00e2\2\2\u008f\u01c2\3\2\2\2\u0090\u0091\7\"\2\2"+
		"\u0091\u0092\7[\2\2\u0092\u0093\5:\36\2\u0093\u0094\7\u00e2\2\2\u0094"+
		"\u01c2\3\2\2\2\u0095\u00a1\t\t\2\2\u0096\u0098\7[\2\2\u0097\u0099\t\n"+
		"\2\2\u0098\u0097\3\2\2\2\u0098\u0099\3\2\2\2\u0099\u009b\3\2\2\2\u009a"+
		"\u009c\7\u011d\2\2\u009b\u009a\3\2\2\2\u009b\u009c\3\2\2\2\u009c\u009e"+
		"\3\2\2\2\u009d\u009f\t\13\2\2\u009e\u009d\3\2\2\2\u009e\u009f\3\2\2\2"+
		"\u009f\u00a0\3\2\2\2\u00a0\u00a2\7\u00e2\2\2\u00a1\u0096\3\2\2\2\u00a1"+
		"\u00a2\3\2\2\2\u00a2\u01c2\3\2\2\2\u00a3\u01c2\7$\2\2\u00a4\u01c2\t\f"+
		"\2\2\u00a5\u01c2\7&\2\2\u00a6\u01c2\t\r\2\2\u00a7\u01c2\7*\2\2\u00a8\u01c2"+
		"\t\16\2\2\u00a9\u01c2\t\17\2\2\u00aa\u01c2\7\61\2\2\u00ab\u01c2\7\67\2"+
		"\2\u00ac\u01c2\7:\2\2\u00ad\u01c2\t\20\2\2\u00ae\u01c2\t\21\2\2\u00af"+
		"\u01c2\7?\2\2\u00b0\u00b1\t\22\2\2\u00b1\u00b2\7[\2\2\u00b2\u00b5\t\23"+
		"\2\2\u00b3\u00b4\7\u011d\2\2\u00b4\u00b6\t\23\2\2\u00b5\u00b3\3\2\2\2"+
		"\u00b5\u00b6\3\2\2\2\u00b6\u00b7\3\2\2\2\u00b7\u01c2\7\u00e2\2\2\u00b8"+
		"\u00b9\7A\2\2\u00b9\u00ba\7[\2\2\u00ba\u00bd\t\24\2\2\u00bb\u00bc\7\u011d"+
		"\2\2\u00bc\u00be\t\25\2\2\u00bd\u00bb\3\2\2\2\u00bd\u00be\3\2\2\2\u00be"+
		"\u00bf\3\2\2\2\u00bf\u01c2\7\u00e2\2\2\u00c0\u01c2\7D\2\2\u00c1\u01c2"+
		"\7E\2\2\u00c2\u00c3\7I\2\2\u00c3\u00c4\7[\2\2\u00c4\u00c5\t\26\2\2\u00c5"+
		"\u01c2\7\u00e2\2\2\u00c6\u00c7\t\27\2\2\u00c7\u00c8\7[\2\2\u00c8\u00c9"+
		"\t\30\2\2\u00c9\u01c2\7\u00e2\2\2\u00ca\u01c2\7P\2\2\u00cb\u01c2\7Q\2"+
		"\2\u00cc\u01c2\7R\2\2\u00cd\u01c2\7T\2\2\u00ce\u00cf\t\31\2\2\u00cf\u00d0"+
		"\7[\2\2\u00d0\u00d1\5:\36\2\u00d1\u00d2\7\u00e2\2\2\u00d2\u01c2\3\2\2"+
		"\2\u00d3\u01c2\7V\2\2\u00d4\u01c2\7W\2\2\u00d5\u01c2\7]\2\2\u00d6\u00d7"+
		"\7^\2\2\u00d7\u00d8\7[\2\2\u00d8\u00d9\5:\36\2\u00d9\u00da\7\u011d\2\2"+
		"\u00da\u00dd\5:\36\2\u00db\u00dc\7\u011d\2\2\u00dc\u00de\5:\36\2\u00dd"+
		"\u00db\3\2\2\2\u00dd\u00de\3\2\2\2\u00de\u00df\3\2\2\2\u00df\u00e0\7\u00e2"+
		"\2\2\u00e0\u01c2\3\2\2\2\u00e1\u00e5\t\32\2\2\u00e2\u00e3\7[\2\2\u00e3"+
		"\u00e4\t\33\2\2\u00e4\u00e6\7\u00e2\2\2\u00e5\u00e2\3\2\2\2\u00e5\u00e6"+
		"\3\2\2\2\u00e6\u01c2\3\2\2\2\u00e7\u00eb\7d\2\2\u00e8\u00e9\7[\2\2\u00e9"+
		"\u00ea\t\34\2\2\u00ea\u00ec\7\u00e2\2\2\u00eb\u00e8\3\2\2\2\u00eb\u00ec"+
		"\3\2\2\2\u00ec\u01c2\3\2\2\2\u00ed\u00ee\7g\2\2\u00ee\u00ef\7[\2\2\u00ef"+
		"\u00f0\t\35\2\2\u00f0\u01c2\7\u00e2\2\2\u00f1\u01c2\7j\2\2\u00f2\u01c2"+
		"\7k\2\2\u00f3\u01c2\7m\2\2\u00f4\u01c2\7n\2\2\u00f5\u01c2\7p\2\2\u00f6"+
		"\u01c2\7q\2\2\u00f7\u01c2\7r\2\2\u00f8\u00fc\t\36\2\2\u00f9\u00fa\7[\2"+
		"\2\u00fa\u00fb\t\37\2\2\u00fb\u00fd\7\u00e2\2\2\u00fc\u00f9\3\2\2\2\u00fc"+
		"\u00fd\3\2\2\2\u00fd\u01c2\3\2\2\2\u00fe\u01c2\7t\2\2\u00ff\u01c2\t \2"+
		"\2\u0100\u01c2\t!\2\2\u0101\u01c2\7y\2\2\u0102\u01c2\7{\2\2\u0103\u01c2"+
		"\t\"\2\2\u0104\u01c2\7~\2\2\u0105\u01c2\7z\2\2\u0106\u01c2\t#\2\2\u0107"+
		"\u01c2\t$\2\2\u0108\u01c2\t%\2\2\u0109\u01c2\7\u0085\2\2\u010a\u01c2\7"+
		"\u0087\2\2\u010b\u01c2\7\u0088\2\2\u010c\u01c2\t&\2\2\u010d\u01c2\t\'"+
		"\2\2\u010e\u01c2\7\u008d\2\2\u010f\u01c2\t(\2\2\u0110\u01c2\7\u008f\2"+
		"\2\u0111\u01c2\7\u0090\2\2\u0112\u01c2\7\u0092\2\2\u0113\u01c2\7\u0094"+
		"\2\2\u0114\u01c2\7\u0095\2\2\u0115\u01c2\7\u0096\2\2\u0116\u01c2\7\u0097"+
		"\2\2\u0117\u01c2\7\u0098\2\2\u0118\u01c2\t)\2\2\u0119\u01c2\7\u009b\2"+
		"\2\u011a\u01c2\t*\2\2\u011b\u01c2\t+\2\2\u011c\u01c2\t,\2\2\u011d\u01c2"+
		"\7\u00a2\2\2\u011e\u01c2\t-\2\2\u011f\u01c2\7\u00a5\2\2\u0120\u01c2\7"+
		"\u00a6\2\2\u0121\u01c2\7\u00a8\2\2\u0122\u01c2\7\u00a9\2\2\u0123\u01c2"+
		"\t.\2\2\u0124\u01c2\t/\2\2\u0125\u01c2\7\u00af\2\2\u0126\u01c2\7\u00b0"+
		"\2\2\u0127\u01c2\t\60\2\2\u0128\u01c2\t\61\2\2\u0129\u01c2\7\u00b5\2\2"+
		"\u012a\u01c2\t\62\2\2\u012b\u01c2\7\u00b9\2\2\u012c\u01c2\7\u00ba\2\2"+
		"\u012d\u01c2\7\u00bc\2\2\u012e\u01c2\t\63\2\2\u012f\u01c2\7\u00c3\2\2"+
		"\u0130\u0131\t\64\2\2\u0131\u0132\7[\2\2\u0132\u0133\t\65\2\2\u0133\u01c2"+
		"\7\u00e2\2\2\u0134\u01c2\7\u00bc\2\2\u0135\u01c2\t\66\2\2\u0136\u01c2"+
		"\7\u00c1\2\2\u0137\u01c2\t\67\2\2\u0138\u0139\7\u00c7\2\2\u0139\u013a"+
		"\7[\2\2\u013a\u013b\t8\2\2\u013b\u01c2\7\u00e2\2\2\u013c\u01c2\t9\2\2"+
		"\u013d\u01c2\t:\2\2\u013e\u013f\7\u00cf\2\2\u013f\u0140\7[\2\2\u0140\u0141"+
		"\5:\36\2\u0141\u0142\7\u011d\2\2\u0142\u0145\5:\36\2\u0143\u0144\7\u011d"+
		"\2\2\u0144\u0146\5:\36\2\u0145\u0143\3\2\2\2\u0145\u0146\3\2\2\2\u0146"+
		"\u0147\3\2\2\2\u0147\u0148\7\u00e2\2\2\u0148\u01c2\3\2\2\2\u0149\u014a"+
		"\7\u00d0\2\2\u014a\u014b\7[\2\2\u014b\u014c\5:\36\2\u014c\u014d\7\u011d"+
		"\2\2\u014d\u014e\5:\36\2\u014e\u014f\7\u00e2\2\2\u014f\u01c2\3\2\2\2\u0150"+
		"\u0154\t;\2\2\u0151\u0152\7[\2\2\u0152\u0153\t<\2\2\u0153\u0155\7\u00e2"+
		"\2\2\u0154\u0151\3\2\2\2\u0154\u0155\3\2\2\2\u0155\u01c2\3\2\2\2\u0156"+
		"\u01c2\7\u00d2\2\2\u0157\u01c2\7\u00d4\2\2\u0158\u01c2\7\u00ce\2\2\u0159"+
		"\u015a\t=\2\2\u015a\u015b\7[\2\2\u015b\u015c\58\35\2\u015c\u015d\7\u00e2"+
		"\2\2\u015d\u01c2\3\2\2\2\u015e\u015f\t>\2\2\u015f\u0160\7[\2\2\u0160\u0161"+
		"\t?\2\2\u0161\u01c2\7\u00e2\2\2\u0162\u01c2\7\u00dc\2\2\u0163\u01c2\t"+
		"@\2\2\u0164\u01c2\7\u00de\2\2\u0165\u0166\7\u00e1\2\2\u0166\u016a\7[\2"+
		"\2\u0167\u016b\7\7\2\2\u0168\u016b\7\13\2\2\u0169\u016b\5:\36\2\u016a"+
		"\u0167\3\2\2\2\u016a\u0168\3\2\2\2\u016a\u0169\3\2\2\2\u016b\u016c\3\2"+
		"\2\2\u016c\u01c2\7\u00e2\2\2\u016d\u0174\tA\2\2\u016e\u016f\7[\2\2\u016f"+
		"\u0170\5:\36\2\u0170\u0171\7\u011d\2\2\u0171\u0172\5:\36\2\u0172\u0173"+
		"\7\u00e2\2\2\u0173\u0175\3\2\2\2\u0174\u016e\3\2\2\2\u0174\u0175\3\2\2"+
		"\2\u0175\u01c2\3\2\2\2\u0176\u0177\tB\2\2\u0177\u017a\7[\2\2\u0178\u017b"+
		"\7_\2\2\u0179\u017b\5:\36\2\u017a\u0178\3\2\2\2\u017a\u0179\3\2\2\2\u017b"+
		"\u017c\3\2\2\2\u017c\u01c2\7\u00e2\2\2\u017d\u01c2\tC\2\2\u017e\u01c2"+
		"\7\u00ea\2\2\u017f\u0180\7\u00eb\2\2\u0180\u0181\7[\2\2\u0181\u0182\5"+
		":\36\2\u0182\u0183\7\u00e2\2\2\u0183\u01c2\3\2\2\2\u0184\u01c2\7\u00ec"+
		"\2\2\u0185\u018a\7\u00ed\2\2\u0186\u0187\7[\2\2\u0187\u0188\5:\36\2\u0188"+
		"\u0189\7\u00e2\2\2\u0189\u018b\3\2\2\2\u018a\u0186\3\2\2\2\u018a\u018b"+
		"\3\2\2\2\u018b\u01c2\3\2\2\2\u018c\u01c2\tD\2\2\u018d\u01c2\tE\2\2\u018e"+
		"\u01c2\7\u00f9\2\2\u018f\u01c2\tF\2\2\u0190\u01a2\7\u00fd\2\2\u0191\u0193"+
		"\7[\2\2\u0192\u0194\tG\2\2\u0193\u0192\3\2\2\2\u0193\u0194\3\2\2\2\u0194"+
		"\u0196\3\2\2\2\u0195\u0197\7\u011d\2\2\u0196\u0195\3\2\2\2\u0196\u0197"+
		"\3\2\2\2\u0197\u0199\3\2\2\2\u0198\u019a\tH\2\2\u0199\u0198\3\2\2\2\u0199"+
		"\u019a\3\2\2\2\u019a\u019c\3\2\2\2\u019b\u019d\7\u011d\2\2\u019c\u019b"+
		"\3\2\2\2\u019c\u019d\3\2\2\2\u019d\u019f\3\2\2\2\u019e\u01a0\tI\2\2\u019f"+
		"\u019e\3\2\2\2\u019f\u01a0\3\2\2\2\u01a0\u01a1\3\2\2\2\u01a1\u01a3\7\u00e2"+
		"\2\2\u01a2\u0191\3\2\2\2\u01a2\u01a3\3\2\2\2\u01a3\u01c2\3\2\2\2\u01a4"+
		"\u01c2\7\u00fe\2\2\u01a5\u01a6\7\u0101\2\2\u01a6\u01a7\7[\2\2\u01a7\u01a8"+
		"\tJ\2\2\u01a8\u01c2\7\u00e2\2\2\u01a9\u01c2\7\u0104\2\2\u01aa\u01ab\t"+
		"K\2\2\u01ab\u01ac\7[\2\2\u01ac\u01ad\58\35\2\u01ad\u01ae\7\u00e2\2\2\u01ae"+
		"\u01c2\3\2\2\2\u01af\u01b0\tL\2\2\u01b0\u01b1\7[\2\2\u01b1\u01b2\tM\2"+
		"\2\u01b2\u01c2\7\u00e2\2\2\u01b3\u01b9\tN\2\2\u01b4\u01b6\7[\2\2\u01b5"+
		"\u01b7\tO\2\2\u01b6\u01b5\3\2\2\2\u01b6\u01b7\3\2\2\2\u01b7\u01b8\3\2"+
		"\2\2\u01b8\u01ba\7\u00e2\2\2\u01b9\u01b4\3\2\2\2\u01b9\u01ba\3\2\2\2\u01ba"+
		"\u01c2\3\2\2\2\u01bb\u01bc\tP\2\2\u01bc\u01bd\7[\2\2\u01bd\u01be\5:\36"+
		"\2\u01be\u01bf\7\u00e2\2\2\u01bf\u01c2\3\2\2\2\u01c0\u01c2\7\u010e\2\2"+
		"\u01c1k\3\2\2\2\u01c1l\3\2\2\2\u01c1m\3\2\2\2\u01c1n\3\2\2\2\u01c1r\3"+
		"\2\2\2\u01c1s\3\2\2\2\u01c1t\3\2\2\2\u01c1y\3\2\2\2\u01c1z\3\2\2\2\u01c1"+
		"\u0081\3\2\2\2\u01c1\u0082\3\2\2\2\u01c1\u0083\3\2\2\2\u01c1\u0088\3\2"+
		"\2\2\u01c1\u0089\3\2\2\2\u01c1\u008a\3\2\2\2\u01c1\u008b\3\2\2\2\u01c1"+
		"\u0090\3\2\2\2\u01c1\u0095\3\2\2\2\u01c1\u00a3\3\2\2\2\u01c1\u00a4\3\2"+
		"\2\2\u01c1\u00a5\3\2\2\2\u01c1\u00a6\3\2\2\2\u01c1\u00a7\3\2\2\2\u01c1"+
		"\u00a8\3\2\2\2\u01c1\u00a9\3\2\2\2\u01c1\u00aa\3\2\2\2\u01c1\u00ab\3\2"+
		"\2\2\u01c1\u00ac\3\2\2\2\u01c1\u00ad\3\2\2\2\u01c1\u00ae\3\2\2\2\u01c1"+
		"\u00af\3\2\2\2\u01c1\u00b0\3\2\2\2\u01c1\u00b8\3\2\2\2\u01c1\u00c0\3\2"+
		"\2\2\u01c1\u00c1\3\2\2\2\u01c1\u00c2\3\2\2\2\u01c1\u00c6\3\2\2\2\u01c1"+
		"\u00ca\3\2\2\2\u01c1\u00cb\3\2\2\2\u01c1\u00cc\3\2\2\2\u01c1\u00cd\3\2"+
		"\2\2\u01c1\u00ce\3\2\2\2\u01c1\u00d3\3\2\2\2\u01c1\u00d4\3\2\2\2\u01c1"+
		"\u00d5\3\2\2\2\u01c1\u00d6\3\2\2\2\u01c1\u00e1\3\2\2\2\u01c1\u00e7\3\2"+
		"\2\2\u01c1\u00ed\3\2\2\2\u01c1\u00f1\3\2\2\2\u01c1\u00f2\3\2\2\2\u01c1"+
		"\u00f3\3\2\2\2\u01c1\u00f4\3\2\2\2\u01c1\u00f5\3\2\2\2\u01c1\u00f6\3\2"+
		"\2\2\u01c1\u00f7\3\2\2\2\u01c1\u00f8\3\2\2\2\u01c1\u00fe\3\2\2\2\u01c1"+
		"\u00ff\3\2\2\2\u01c1\u0100\3\2\2\2\u01c1\u0101\3\2\2\2\u01c1\u0102\3\2"+
		"\2\2\u01c1\u0103\3\2\2\2\u01c1\u0104\3\2\2\2\u01c1\u0105\3\2\2\2\u01c1"+
		"\u0106\3\2\2\2\u01c1\u0107\3\2\2\2\u01c1\u0108\3\2\2\2\u01c1\u0109\3\2"+
		"\2\2\u01c1\u010a\3\2\2\2\u01c1\u010b\3\2\2\2\u01c1\u010c\3\2\2\2\u01c1"+
		"\u010d\3\2\2\2\u01c1\u010e\3\2\2\2\u01c1\u010f\3\2\2\2\u01c1\u0110\3\2"+
		"\2\2\u01c1\u0111\3\2\2\2\u01c1\u0112\3\2\2\2\u01c1\u0113\3\2\2\2\u01c1"+
		"\u0114\3\2\2\2\u01c1\u0115\3\2\2\2\u01c1\u0116\3\2\2\2\u01c1\u0117\3\2"+
		"\2\2\u01c1\u0118\3\2\2\2\u01c1\u0119\3\2\2\2\u01c1\u011a\3\2\2\2\u01c1"+
		"\u011b\3\2\2\2\u01c1\u011c\3\2\2\2\u01c1\u011d\3\2\2\2\u01c1\u011e\3\2"+
		"\2\2\u01c1\u011f\3\2\2\2\u01c1\u0120\3\2\2\2\u01c1\u0121\3\2\2\2\u01c1"+
		"\u0122\3\2\2\2\u01c1\u0123\3\2\2\2\u01c1\u0124\3\2\2\2\u01c1\u0125\3\2"+
		"\2\2\u01c1\u0126\3\2\2\2\u01c1\u0127\3\2\2\2\u01c1\u0128\3\2\2\2\u01c1"+
		"\u0129\3\2\2\2\u01c1\u012a\3\2\2\2\u01c1\u012b\3\2\2\2\u01c1\u012c\3\2"+
		"\2\2\u01c1\u012d\3\2\2\2\u01c1\u012e\3\2\2\2\u01c1\u012f\3\2\2\2\u01c1"+
		"\u0130\3\2\2\2\u01c1\u0134\3\2\2\2\u01c1\u0135\3\2\2\2\u01c1\u0136\3\2"+
		"\2\2\u01c1\u0137\3\2\2\2\u01c1\u0138\3\2\2\2\u01c1\u013c\3\2\2\2\u01c1"+
		"\u013d\3\2\2\2\u01c1\u013e\3\2\2\2\u01c1\u0149\3\2\2\2\u01c1\u0150\3\2"+
		"\2\2\u01c1\u0156\3\2\2\2\u01c1\u0157\3\2\2\2\u01c1\u0158\3\2\2\2\u01c1"+
		"\u0159\3\2\2\2\u01c1\u015e\3\2\2\2\u01c1\u0162\3\2\2\2\u01c1\u0163\3\2"+
		"\2\2\u01c1\u0164\3\2\2\2\u01c1\u0165\3\2\2\2\u01c1\u016d\3\2\2\2\u01c1"+
		"\u0176\3\2\2\2\u01c1\u017d\3\2\2\2\u01c1\u017e\3\2\2\2\u01c1\u017f\3\2"+
		"\2\2\u01c1\u0184\3\2\2\2\u01c1\u0185\3\2\2\2\u01c1\u018c\3\2\2\2\u01c1"+
		"\u018d\3\2\2\2\u01c1\u018e\3\2\2\2\u01c1\u018f\3\2\2\2\u01c1\u0190\3\2"+
		"\2\2\u01c1\u01a4\3\2\2\2\u01c1\u01a5\3\2\2\2\u01c1\u01a9\3\2\2\2\u01c1"+
		"\u01aa\3\2\2\2\u01c1\u01af\3\2\2\2\u01c1\u01b3\3\2\2\2\u01c1\u01bb\3\2"+
		"\2\2\u01c1\u01c0\3\2\2\2\u01c2\t\3\2\2\2\u01c3\u01c4\79\2\2\u01c4\u01c5"+
		"\7\24\2\2\u01c5\u01c6\5\62\32\2\u01c6\u01c8\7\66\2\2\u01c7\u01c9\7\u011e"+
		"\2\2\u01c8\u01c7\3\2\2\2\u01c8\u01c9\3\2\2\2\u01c9\13\3\2\2\2\u01ca\u01cb"+
		"\79\2\2\u01cb\u01ce\7\u00ed\2\2\u01cc\u01cf\5\20\t\2\u01cd\u01cf\5\64"+
		"\33\2\u01ce\u01cc\3\2\2\2\u01ce\u01cd\3\2\2\2\u01cf\u01d0\3\2\2\2\u01d0"+
		"\u01d2\7\66\2\2\u01d1\u01d3\7\u011e\2\2\u01d2\u01d1\3\2\2\2\u01d2\u01d3"+
		"\3\2\2\2\u01d3\r\3\2\2\2\u01d4\u01d5\79\2\2\u01d5\u01d6\7\u00f0\2\2\u01d6"+
		"\u01d7\5\62\32\2\u01d7\u01d9\7\66\2\2\u01d8\u01da\7\u011e\2\2\u01d9\u01d8"+
		"\3\2\2\2\u01d9\u01da\3\2\2\2\u01da\17\3\2\2\2\u01db\u01dc\7H\2\2\u01dc"+
		"\u01dd\5\24\13\2\u01dd\21\3\2\2\2\u01de\u01df\7\33\2\2\u01df\u01ee\5\24"+
		"\13\2\u01e0\u01e2\7\u0124\2\2\u01e1\u01e0\3\2\2\2\u01e2\u01e5\3\2\2\2"+
		"\u01e3\u01e1\3\2\2\2\u01e3\u01e4\3\2\2\2\u01e4\u01ea\3\2\2\2\u01e5\u01e3"+
		"\3\2\2\2\u01e6\u01eb\5\"\22\2\u01e7\u01eb\5$\23\2\u01e8\u01eb\5\30\r\2"+
		"\u01e9\u01eb\7\u00f8\2\2\u01ea\u01e6\3\2\2\2\u01ea\u01e7\3\2\2\2\u01ea"+
		"\u01e8\3\2\2\2\u01ea\u01e9\3\2\2\2\u01eb\u01ed\3\2\2\2\u01ec\u01e3\3\2"+
		"\2\2\u01ed\u01f0\3\2\2\2\u01ee\u01ec\3\2\2\2\u01ee\u01ef\3\2\2\2\u01ef"+
		"\u01f4\3\2\2\2\u01f0\u01ee\3\2\2\2\u01f1\u01f3\7\u0124\2\2\u01f2\u01f1"+
		"\3\2\2\2\u01f3\u01f6\3\2\2\2\u01f4\u01f2\3\2\2\2\u01f4\u01f5\3\2\2\2\u01f5"+
		"\u01f7\3\2\2\2\u01f6\u01f4\3\2\2\2\u01f7\u01f8\7\u011e\2\2\u01f8\23\3"+
		"\2\2\2\u01f9\u01fd\5:\36\2\u01fa\u01fd\58\35\2\u01fb\u01fd\5<\37\2\u01fc"+
		"\u01f9\3\2\2\2\u01fc\u01fa\3\2\2\2\u01fc\u01fb\3\2\2\2\u01fd\u0200\3\2"+
		"\2\2\u01fe\u01ff\tQ\2\2\u01ff\u0201\5\26\f\2\u0200\u01fe\3\2\2\2\u0200"+
		"\u0201\3\2\2\2\u0201\25\3\2\2\2\u0202\u0205\5:\36\2\u0203\u0205\58\35"+
		"\2\u0204\u0202\3\2\2\2\u0204\u0203\3\2\2\2\u0205\27\3\2\2\2\u0206\u020a"+
		"\7\u00e0\2\2\u0207\u0209\7\u0124\2\2\u0208\u0207\3\2\2\2\u0209\u020c\3"+
		"\2\2\2\u020a\u0208\3\2\2\2\u020a\u020b\3\2\2\2\u020b\u020d\3\2\2\2\u020c"+
		"\u020a\3\2\2\2\u020d\u0216\5 \21\2\u020e\u0210\7\u0124\2\2\u020f\u020e"+
		"\3\2\2\2\u0210\u0211\3\2\2\2\u0211\u020f\3\2\2\2\u0211\u0212\3\2\2\2\u0212"+
		"\u0213\3\2\2\2\u0213\u0215\5 \21\2\u0214\u020f\3\2\2\2\u0215\u0218\3\2"+
		"\2\2\u0216\u0214\3\2\2\2\u0216\u0217\3\2\2\2\u0217\31\3\2\2\2\u0218\u0216"+
		"\3\2\2\2\u0219\u021e\5\34\17\2\u021a\u021d\5\22\n\2\u021b\u021d\5\62\32"+
		"\2\u021c\u021a\3\2\2\2\u021c\u021b\3\2\2\2\u021d\u0220\3\2\2\2\u021e\u021c"+
		"\3\2\2\2\u021e\u021f\3\2\2\2\u021f\u0222\3\2\2\2\u0220\u021e\3\2\2\2\u0221"+
		"\u0223\5\36\20\2\u0222\u0221\3\2\2\2\u0222\u0223\3\2\2\2\u0223\33\3\2"+
		"\2\2\u0224\u022c\7\u00df\2\2\u0225\u0227\7\u0124\2\2\u0226\u0225\3\2\2"+
		"\2\u0227\u022a\3\2\2\2\u0228\u0226\3\2\2\2\u0228\u0229\3\2\2\2\u0229\u022b"+
		"\3\2\2\2\u022a\u0228\3\2\2\2\u022b\u022d\5 \21\2\u022c\u0228\3\2\2\2\u022d"+
		"\u022e\3\2\2\2\u022e\u022c\3\2\2\2\u022e\u022f\3\2\2\2\u022f\u0230\3\2"+
		"\2\2\u0230\u0231\7\u011e\2\2\u0231\35\3\2\2\2\u0232\u0233\7\u00df\2\2"+
		"\u0233\u0234\7\u00cb\2\2\u0234\u0235\7\u011e\2\2\u0235\37\3\2\2\2\u0236"+
		"\u023a\5&\24\2\u0237\u0239\7\u0124\2\2\u0238\u0237\3\2\2\2\u0239\u023c"+
		"\3\2\2\2\u023a\u0238\3\2\2\2\u023a\u023b\3\2\2\2\u023b\u023d\3\2\2\2\u023c"+
		"\u023a\3\2\2\2\u023d\u0241\7\21\2\2\u023e\u0240\7\u0124\2\2\u023f\u023e"+
		"\3\2\2\2\u0240\u0243\3\2\2\2\u0241\u023f\3\2\2\2\u0241\u0242\3\2\2\2\u0242"+
		"\u0244\3\2\2\2\u0243\u0241\3\2\2\2\u0244\u024c\5(\25\2\u0245\u0247\7\u0124"+
		"\2\2\u0246\u0245\3\2\2\2\u0247\u024a\3\2\2\2\u0248\u0246\3\2\2\2\u0248"+
		"\u0249\3\2\2\2\u0249\u024b\3\2\2\2\u024a\u0248\3\2\2\2\u024b\u024d\5\""+
		"\22\2\u024c\u0248\3\2\2\2\u024c\u024d\3\2\2\2\u024d\u0255\3\2\2\2\u024e"+
		"\u0250\7\u0124\2\2\u024f\u024e\3\2\2\2\u0250\u0253\3\2\2\2\u0251\u024f"+
		"\3\2\2\2\u0251\u0252\3\2\2\2\u0252\u0254\3\2\2\2\u0253\u0251\3\2\2\2\u0254"+
		"\u0256\5$\23\2\u0255\u0251\3\2\2\2\u0255\u0256\3\2\2\2\u0256!\3\2\2\2"+
		"\u0257\u025b\tQ\2\2\u0258\u025a\7\u0124\2\2\u0259\u0258\3\2\2\2\u025a"+
		"\u025d\3\2\2\2\u025b\u0259\3\2\2\2\u025b\u025c\3\2\2\2\u025c\u0260\3\2"+
		"\2\2\u025d\u025b\3\2\2\2\u025e\u0261\5:\36\2\u025f\u0261\58\35\2\u0260"+
		"\u025e\3\2\2\2\u0260\u025f\3\2\2\2\u0261#\3\2\2\2\u0262\u0266\7\u00cd"+
		"\2\2\u0263\u0265\7\u0124\2\2\u0264\u0263\3\2\2\2\u0265\u0268\3\2\2\2\u0266"+
		"\u0264\3\2\2\2\u0266\u0267\3\2\2\2\u0267\u026b\3\2\2\2\u0268\u0266\3\2"+
		"\2\2\u0269\u026c\5:\36\2\u026a\u026c\58\35\2\u026b\u0269\3\2\2\2\u026b"+
		"\u026a\3\2\2\2\u026c%\3\2\2\2\u026d\u0272\5:\36\2\u026e\u0272\58\35\2"+
		"\u026f\u0272\5\60\31\2\u0270\u0272\5\66\34\2\u0271\u026d\3\2\2\2\u0271"+
		"\u026e\3\2\2\2\u0271\u026f\3\2\2\2\u0271\u0270\3\2\2\2\u0272\'\3\2\2\2"+
		"\u0273\u0278\5:\36\2\u0274\u0278\58\35\2\u0275\u0278\5\60\31\2\u0276\u0278"+
		"\5\66\34\2\u0277\u0273\3\2\2\2\u0277\u0274\3\2\2\2\u0277\u0275\3\2\2\2"+
		"\u0277\u0276\3\2\2\2\u0278)\3\2\2\2\u0279\u027b\7\62\2\2\u027a\u027c\7"+
		"\u011e\2\2\u027b\u027a\3\2\2\2\u027b\u027c\3\2\2\2\u027c+\3\2\2\2\u027d"+
		"\u027f\tR\2\2\u027e\u0280\7\u011e\2\2\u027f\u027e\3\2\2\2\u027f\u0280"+
		"\3\2\2\2\u0280-\3\2\2\2\u0281\u0282\7\u00ff\2\2\u0282\u0284\5:\36\2\u0283"+
		"\u0285\7\u011e\2\2\u0284\u0283\3\2\2\2\u0284\u0285\3\2\2\2\u0285/\3\2"+
		"\2\2\u0286\u0288\7\u011f\2\2\u0287\u0289\5\62\32\2\u0288\u0287\3\2\2\2"+
		"\u0288\u0289\3\2\2\2\u0289\u028a\3\2\2\2\u028a\u028b\7\u011f\2\2\u028b"+
		"\61\3\2\2\2\u028c\u028f\5\66\34\2\u028d\u028f\7\u0124\2\2\u028e\u028c"+
		"\3\2\2\2\u028e\u028d\3\2\2\2\u028f\u0290\3\2\2\2\u0290\u028e\3\2\2\2\u0290"+
		"\u0291\3\2\2\2\u0291\63\3\2\2\2\u0292\u0297\5\66\34\2\u0293\u0297\7\33"+
		"\2\2\u0294\u0297\7\u00df\2\2\u0295\u0297\7\u0124\2\2\u0296\u0292\3\2\2"+
		"\2\u0296\u0293\3\2\2\2\u0296\u0294\3\2\2\2\u0296\u0295\3\2\2\2\u0297\u0298"+
		"\3\2\2\2\u0298\u0296\3\2\2\2\u0298\u0299\3\2\2\2\u0299\65\3\2\2\2\u029a"+
		"\u02a2\58\35\2\u029b\u02a2\5:\36\2\u029c\u02a2\5<\37\2\u029d\u02a2\7\u0127"+
		"\2\2\u029e\u02a2\7\u011e\2\2\u029f\u02a2\7[\2\2\u02a0\u02a2\7\u00e2\2"+
		"\2\u02a1\u029a\3\2\2\2\u02a1\u029b\3\2\2\2\u02a1\u029c\3\2\2\2\u02a1\u029d"+
		"\3\2\2\2\u02a1\u029e\3\2\2\2\u02a1\u029f\3\2\2\2\u02a1\u02a0\3\2\2\2\u02a2"+
		"\u02a3\3\2\2\2\u02a3\u02a1\3\2\2\2\u02a3\u02a4\3\2\2\2\u02a4\67\3\2\2"+
		"\2\u02a5\u02a8\7\u0122\2\2\u02a6\u02a8\5> \2\u02a7\u02a5\3\2\2\2\u02a7"+
		"\u02a6\3\2\2\2\u02a89\3\2\2\2\u02a9\u02aa\tS\2\2\u02aa;\3\2\2\2\u02ab"+
		"\u02ac\7\u0123\2\2\u02ac=\3\2\2\2\u02ad\u02ae\tT\2\2\u02ae?\3\2\2\2ML"+
		"NUY[af\177\u0098\u009b\u009e\u00a1\u00b5\u00bd\u00dd\u00e5\u00eb\u00fc"+
		"\u0145\u0154\u016a\u0174\u017a\u018a\u0193\u0196\u0199\u019c\u019f\u01a2"+
		"\u01b6\u01b9\u01c1\u01c8\u01ce\u01d2\u01d9\u01e3\u01ea\u01ee\u01f4\u01fc"+
		"\u0200\u0204\u020a\u0211\u0216\u021c\u021e\u0222\u0228\u022e\u023a\u0241"+
		"\u0248\u024c\u0251\u0255\u025b\u0260\u0266\u026b\u0271\u0277\u027b\u027f"+
		"\u0284\u0288\u028e\u0290\u0296\u0298\u02a1\u02a3\u02a7";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}