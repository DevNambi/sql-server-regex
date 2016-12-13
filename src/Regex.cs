using System;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Generic;

public partial class UDF
{
    [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic =true, IsPrecise =true)]
    public static SqlString Match(String input, String pattern)
    {
        Regex r = new Regex(pattern);
        Match m = r.Match(input);

        SqlString value = m.Success ? m.Value : null;
        return value;
    }

    [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
    public static SqlString GroupMatch(String input, String pattern, String group)
    {
        Regex r = new Regex(pattern);
        Group g = r.Match(input).Groups[group];

        SqlString value = g.Success ? g.Value : null;
        return value;
    }

    [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
    public static SqlString Replace(String input, String pattern, String replacement)
    {
        Regex r = new Regex(pattern);
        return new SqlString(r.Replace(input, replacement));
    }

    [SqlFunction(DataAccess = DataAccessKind.Read, FillRowMethodName = "FillMatches", TableDefinition = "Position int, MatchText nvarchar(max)")]
    public static IEnumerable Matches(String input, String pattern)
    {
        List<RegexMatch> MatchCollection = new List<RegexMatch>();
        foreach (Match m in Regex.Matches(input, pattern))
        {
            MatchCollection.Add(new RegexMatch(m.Index, m.Value));
        }

        return MatchCollection;
    }

    [SqlFunction(DataAccess = DataAccessKind.Read, FillRowMethodName = "FillMatches", TableDefinition = "Position int, MatchText nvarchar(max)")]
    public static IEnumerable Split(String input, String pattern)
    {
        List<RegexMatch> MatchCollection = new List<RegexMatch>();
        String[] splits = Regex.Split(input, pattern);
        for (int i=0; i < splits.Length; i++)
        {
            MatchCollection.Add(new RegexMatch(i, splits[i]));
        }

        return MatchCollection;
    }

    public static void FillMatches(object match, out SqlInt32 Position, out SqlString MatchText)
    {
        RegexMatch rm = (RegexMatch)match;
        Position = rm.Position;
        MatchText = rm.MatchText;
    }

    private class RegexMatch
    {
        public SqlInt32 Position { get; set; }
        public SqlString MatchText { get; set; }

        public RegexMatch(SqlInt32 position, SqlString match)
        {
            this.Position = position;
            this.MatchText = match;
        }
    }
};

