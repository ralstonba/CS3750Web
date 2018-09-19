using Newtonsoft.Json;
using System;
using System.Collections.Generic;

public sealed class Singleton
{
    private static volatile Singleton instance;
    private static object syncRoot = new Object();
    private static IDictionary<string, int> votes = new Dictionary<string, int>();

    private Singleton() {  }

    public static Singleton Instance
    {
        get
        {
            if (instance == null)
            {
                lock (syncRoot)
                {
                    if (instance == null)
                        instance = new Singleton();
                }
            }

            return instance;
        }
    }

    public void AddVote(string drink)
    {
        if (instance != null)
        {
            if (votes.ContainsKey(drink))
            {
                votes[drink] = votes[drink]++;
            }
            else
            {
                votes.Add(drink, 1);
            }
        }
    }

    public string GetVotesJSON()
    {
        return JsonConvert.SerializeObject(votes, Formatting.Indented);
    }
}