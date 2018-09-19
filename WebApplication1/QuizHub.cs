using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace WebApplication1
{
    public class QuizHub : Hub
    {
        public void UpdateCounts(string drink)
        {
            Singleton votes = Singleton.Instance;
            votes.AddVote(drink);
            Clients.All.updateGraph(votes.GetVotesJSON());
        }
    }
}