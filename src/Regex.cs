using System;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Generic;

public partial class UDF
{
    [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true)]
    public static SqlString Match(String input, String pattern)
    {
        if (String.IsNullOrEmpty(input) || String.IsNullOrEmpty(pattern))
        {
            return new SqlString(null);
        }
        else
        {
            Match m = Regex.Match(input, pattern);

            return new SqlString(m.Success ? m.Value : null);
        }
    }

    [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
    public static SqlString GroupMatch(String input, String pattern, String group)
    {
        if (String.IsNullOrEmpty(input) || String.IsNullOrEmpty(pattern) || String.IsNullOrEmpty(group))
        {
            return new SqlString(null);
        }
        else
        { 
            Group g = Regex.Match(input, pattern).Groups[group];

            return new SqlString(g.Success ? g.Value : null);
        }
    }

    [Microsoft.SqlServer.Server.SqlFunction(IsDeterministic = true, IsPrecise = true)]
    public static SqlString Replace(String input, String pattern, String replacement)
    {
        // the replacement string is not checked for an empty string because that is a valid replacement pattern
        if (String.IsNullOrEmpty(input) || String.IsNullOrEmpty(pattern) || replacement == null)
        {
            return new SqlString(null);
        }
        else
        {
            return new SqlString(Regex.Replace(input, pattern, replacement));
        }
    }

    [SqlFunction(DataAccess = DataAccessKind.None, FillRowMethodName = "FillMatches", TableDefinition = "Position int, MatchText nvarchar(max)")]
    public static IEnumerable Matches(String input, String pattern)
    {
        List<RegexMatch> MatchCollection = new List<RegexMatch>();
        if (!String.IsNullOrEmpty(input) && !String.IsNullOrEmpty(pattern))
        {
            //only run through the matches if the inputs have non-empty, non-null strings
            foreach (Match m in Regex.Matches(input, pattern))
            {
                MatchCollection.Add(new RegexMatch(m.Index, m.Value));
            }
        }
        return MatchCollection;
    }

    [SqlFunction(DataAccess = DataAccessKind.None, FillRowMethodName = "FillMatches", TableDefinition = "Position int, MatchText nvarchar(max)")]
    public static IEnumerable Split(String input, String pattern)
    {
        List<RegexMatch> MatchCollection = new List<RegexMatch>();
        if (!String.IsNullOrEmpty(input) && !String.IsNullOrEmpty(pattern))
        {
            //only run through the splits if the inputs have non-empty, non-null strings
            String[] splits = Regex.Split(input, pattern);
            for (int i = 0; i < splits.Length; i++)
            {
                MatchCollection.Add(new RegexMatch(i, splits[i]));
            }
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

